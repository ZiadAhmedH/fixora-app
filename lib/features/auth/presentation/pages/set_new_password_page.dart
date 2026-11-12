import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../config/routes/route_names.dart';
import '../bloc/set_password_bloc.dart';
import '../bloc/set_password_event.dart';
import '../bloc/set_password_state.dart';
import '../sections/set_password_form_section.dart';
import '../sections/set_password_hero_section.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SetNewPasswordPage
// ─────────────────────────────────────────────────────────────────────────────
//
// HOW THIS PAGE IS REACHED:
//   The user taps the reset link in their email →
//   the OS opens this Flutter app via a deep link →
//   GoRouter parses the URL and extracts the [oobCode] query parameter →
//   GoRouter navigates to RouteNames.setNewPassword, passing [oobCode] as extra →
//   This page is built with a [SetPasswordBloc] that receives [oobCode].
//
// ON LOAD:
//   The BLoC immediately fires [SetPasswordEvent.started] which calls
//   [VerifyResetCodeUseCase] to check the code is still valid.
//   This protects against expired or already-used links.
//
// STATES HANDLED:
//   • validating  → show loading spinner (checking code with Firebase)
//   • codeError   → show error screen with "Request New Link" button
//   • ready       → show the password form
//   • loading     → spinner on button, form disabled
//   • success     → navigate to login with success snackbar
//   • failure     → snackbar with error, form stays visible
// ─────────────────────────────────────────────────────────────────────────────

class SetNewPasswordPage extends StatefulWidget {
  /// The one-time code from the Firebase reset email deep link.
  /// GoRouter extracts this from the URL query parameter: ?oobCode=XYZ
  final String oobCode;

  const SetNewPasswordPage({super.key, required this.oobCode});

  @override
  State<SetNewPasswordPage> createState() => _SetNewPasswordPageState();
}

class _SetNewPasswordPageState extends State<SetNewPasswordPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  late final AnimationController _animCtrl;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();

    // Entrance animation — same style as login/register screens.
    _animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fadeAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut));
    _animCtrl.forward();

    // Kick off oobCode validation immediately when the page loads.
    // If expired, the BLoC will emit [codeError] before the user does anything.
    context
        .read<SetPasswordBloc>()
        .add(SetPasswordEvent.started(oobCode: widget.oobCode));
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  void _onPasswordChanged() {
    // Notify the BLoC on every keystroke so the requirements UI updates live.
    context.read<SetPasswordBloc>().add(
          SetPasswordEvent.passwordChanged(
            password: _passwordCtrl.text,
            confirm: _confirmCtrl.text,
          ),
        );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<SetPasswordBloc>().add(
          SetPasswordEvent.submitted(
            password: _passwordCtrl.text,
            confirm: _confirmCtrl.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: BlocConsumer<SetPasswordBloc, SetPasswordState>(
        listener: _listener,
        builder: (context, state) => state.map(
          // ── Checking oobCode with Firebase ──
          validating: (_) => const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          ),

          // ── oobCode expired or already used ──
          codeError: (s) => _CodeExpiredBody(
            isDark: isDark,
            message: s.message,
          ),

          // ── Show the password form ──
          ready: (s) => _buildForm(
            isDark: isDark,
            email: s.email,
            requirements: s.requirements,
            isLoading: false,
          ),

          // ── Firebase call in progress ──
          loading: (s) => _buildForm(
            isDark: isDark,
            email: s.email,
            requirements: s.requirements,
            isLoading: true,
          ),

          // ── Success is handled by the listener below ──
          success: (_) => const SizedBox.shrink(),

          // ── Error — keep form visible, snackbar shown by listener ──
          failure: (s) => _buildForm(
            isDark: isDark,
            email: s.email,
            requirements: s.requirements,
            isLoading: false,
          ),
        ),
      ),
    );
  }

  /// Builds the scrollable hero + form layout used in [ready], [loading],
  /// and [failure] states.
  Widget _buildForm({
    required bool isDark,
    required String email,
    required PasswordRequirements requirements,
    required bool isLoading,
  }) {
    return Column(
      children: [
        SetPasswordHeroSection(isDark: isDark),
        Expanded(
          child: FadeTransition(
            opacity: _fadeAnim,
            child: SlideTransition(
              position: _slideAnim,
              child: SetPasswordFormSection(
                isDark: isDark,
                formKey: _formKey,
                email: email,
                passwordCtrl: _passwordCtrl,
                confirmCtrl: _confirmCtrl,
                requirements: requirements,
                isLoading: isLoading,
                onPasswordChanged: _onPasswordChanged,
                onSubmit: _submit,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _listener(BuildContext context, SetPasswordState state) {
    state.mapOrNull(
      // ── Password changed successfully — go to login ──
      success: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).passwordResetSuccess),
            backgroundColor: AppColors.success,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
        // Replace the entire stack with login — the user must sign in again
        // with their new password. We use [go] (not [pop]) so the deep-link
        // route is fully replaced and the back button doesn't go back to this page.
        context.go(RouteNames.login);
      },

      // ── Something went wrong — show a floating error snackbar ──
      failure: (f) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(f.message),
              backgroundColor: AppColors.error,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _CodeExpiredBody — Shown when the oobCode is expired or already used
// ─────────────────────────────────────────────────────────────────────────────

class _CodeExpiredBody extends StatelessWidget {
  final bool isDark;
  final String message;

  const _CodeExpiredBody({required this.isDark, required this.message});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Error icon
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.link_off_rounded,
                color: AppColors.error,
                size: 48,
              ),
            ),
            const SizedBox(height: 24),

            // Title
            Text(
              l10n.linkExpiredTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: isDark
                    ? AppColors.darkOnSurface
                    : AppColors.lightOnSurface,
              ),
            ),
            const SizedBox(height: 12),

            // Error message from Firebase
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: isDark
                    ? AppColors.darkOnSurfaceVariant
                    : AppColors.lightOnSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),

            // Go back and request a new link
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () => context.go(RouteNames.forgotPassword),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  l10n.requestNewLink,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

