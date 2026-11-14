import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/routes/route_names.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/set_password_bloc.dart';
import '../bloc/set_password_event.dart';
import '../bloc/set_password_state.dart';
import '../sections/set_password_form_section.dart';
import '../sections/set_password_hero_section.dart';

class SetNewPasswordPage extends StatefulWidget {
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: BlocConsumer<SetPasswordBloc, SetPasswordState>(
          listener: _listener,
          builder: (context, state) => state.map(
            validating: (_) => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
            codeError: (s) => Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: AppConstants.maxFormWidth,
                ),
                child: _CodeExpiredBody(
                  isDark: isDark,
                  message: s.message,
                ),
              ),
            ),
            ready: (s) => _buildForm(
              isDark: isDark,
              email: s.email,
              requirements: s.requirements,
              isLoading: false,
            ),
            loading: (s) => _buildForm(
              isDark: isDark,
              email: s.email,
              requirements: s.requirements,
              isLoading: true,
            ),
            success: (_) => const SizedBox.shrink(),
            failure: (s) => _buildForm(
              isDark: isDark,
              email: s.email,
              requirements: s.requirements,
              isLoading: false,
            ),
          ),
        ),
      ),
    );
  }

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
        context.go(RouteNames.login);
      },
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
