import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/routes/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/google_sign_in_button.dart';
import '../widgets/primary_auth_button.dart';
import 'login_section_label.dart';

class LoginFormSection extends StatelessWidget {
  final bool isDark;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;
  final VoidCallback onSubmit;
  final VoidCallback onGoogleSignIn;

  const LoginFormSection({
    super.key,
    required this.isDark,
    required this.formKey,
    required this.emailCtrl,
    required this.passCtrl,
    required this.onSubmit,
    required this.onGoogleSignIn,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cardColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.08),
            blurRadius: 24,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Credentials section ─────────────────────────────────
              LoginSectionLabel(isDark: isDark, label: l10n.credentials),
              const SizedBox(height: 14),

              // ── Email ───────────────────────────────────────────────
              AuthTextField(
                label: l10n.email,
                hint: 'you@example.com',
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                validator: (v) {
                  if (v == null || v.isEmpty) return l10n.enterYourEmail;
                  if (!v.contains('@')) return l10n.invalidEmail;
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // ── Password ────────────────────────────────────────────
              AuthTextField(
                label: l10n.password,
                hint: '••••••••',
                controller: passCtrl,
                isPassword: true,
                prefixIcon: Icons.lock_outline,
                validator: (v) {
                  if (v == null || v.isEmpty) return l10n.enterYourPassword;
                  if (v.length < 6) return l10n.minSixChars;
                  return null;
                },
              ),

              // ── Forgot password ─────────────────────────────────────
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 8,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    l10n.forgotPassword,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),

              BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (p, c) => c.maybeMap(
                  loadingEmail: (_) => true,
                  loadingGoogle: (_) => true,
                  failure: (_) => true,
                  unauthenticated: (_) => true,
                  orElse: () => false,
                ),
                builder: (context, state) {
                  final isEmailLoading = state.maybeMap(
                    loadingEmail: (_) => true,
                    orElse: () => false,
                  );
                  final isGoogleLoading = state.maybeMap(
                    loadingGoogle: (_) => true,
                    orElse: () => false,
                  );
                  return PrimaryAuthButton(
                    label: l10n.signIn,
                    isLoading: isEmailLoading,
                    onPressed: (isEmailLoading || isGoogleLoading)
                        ? null
                        : onSubmit,
                  );
                },
              ),
              const SizedBox(height: 22),

              LoginSectionLabel(isDark: isDark, label: l10n.orContinueWith),
              const SizedBox(height: 14),

              // Google button
              BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (p, c) => c.maybeMap(
                  loadingEmail: (_) => true,
                  loadingGoogle: (_) => true,
                  failure: (_) => true,
                  unauthenticated: (_) => true,
                  orElse: () => false,
                ),
                builder: (context, state) {
                  final isGoogleLoading = state.maybeMap(
                    loadingGoogle: (_) => true,
                    orElse: () => false,
                  );
                  final isEmailLoading = state.maybeMap(
                    loadingEmail: (_) => true,
                    orElse: () => false,
                  );
                  return GoogleSignInButton(
                    isLoading: isGoogleLoading,
                    onPressed: (isGoogleLoading || isEmailLoading)
                        ? null
                        : onGoogleSignIn,
                  );
                },
              ),
              const SizedBox(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${l10n.dontHaveAccount} ',
                    style: TextStyle(
                      color: isDark
                          ? AppColors.darkOnSurfaceVariant
                          : AppColors.grey500,
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.push(RouteNames.register),
                    child: Text(
                      l10n.register,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
