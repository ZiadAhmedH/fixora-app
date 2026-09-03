import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/app_user.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/google_sign_in_button.dart';
import '../widgets/primary_auth_button.dart';
import 'login_section_label.dart';

/// Section 2 — Rounded card with the full registration form.
class RegisterFormSection extends StatelessWidget {
  final bool isDark;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameCtrl;
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;
  final TextEditingController confirmPassCtrl;
  final UserRole selectedRole;
  final ValueChanged<UserRole> onRoleChanged;
  final VoidCallback onSubmit;
  final VoidCallback onGoogleSignIn;

  const RegisterFormSection({
    super.key,
    required this.isDark,
    required this.formKey,
    required this.nameCtrl,
    required this.emailCtrl,
    required this.passCtrl,
    required this.confirmPassCtrl,
    required this.selectedRole,
    required this.onRoleChanged,
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
              // ── Role section ──────────────────────────────────────────
              LoginSectionLabel(isDark: isDark, label: l10n.iAmRegisteringAs),
              const SizedBox(height: 12),
              _RoleSelector(
                selected: selectedRole,
                onChanged: onRoleChanged,
              ),
              const SizedBox(height: 22),

              // ── Details section ───────────────────────────────────────
              LoginSectionLabel(isDark: isDark, label: l10n.accountDetails),
              const SizedBox(height: 14),

              // Full name
              AuthTextField(
                label: l10n.fullName,
                hint: l10n.fullNameHint,
                controller: nameCtrl,
                prefixIcon: Icons.person_outline,
                validator: (v) {
                  if (v == null || v.isEmpty) return l10n.enterYourName;
                  if (v.length < 2) return l10n.nameTooShort;
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Email
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

              // Password
              AuthTextField(
                label: l10n.password,
                hint: '••••••••',
                controller: passCtrl,
                isPassword: true,
                prefixIcon: Icons.lock_outline,
                validator: (v) {
                  if (v == null || v.isEmpty) return l10n.enterAPassword;
                  if (v.length < 6) return l10n.minSixChars;
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Confirm password
              AuthTextField(
                label: l10n.confirmPassword,
                hint: '••••••••',
                controller: confirmPassCtrl,
                isPassword: true,
                prefixIcon: Icons.lock_outline,
                validator: (v) {
                  if (v == null || v.isEmpty) return l10n.confirmYourPassword;
                  if (v != passCtrl.text) return l10n.passwordsDoNotMatch;
                  return null;
                },
              ),
              const SizedBox(height: 22),

              // ── Create Account button ─────────────────────────────────
              BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (p, c) => c.maybeMap(
                  loading: (_) => true,
                  registerSuccess: (_) => true,
                  failure: (_) => true,
                  unauthenticated: (_) => true,
                  orElse: () => false,
                ),
                builder: (context, state) {
                  final isLoading = state.maybeMap(
                    loading: (_) => true,
                    orElse: () => false,
                  );
                  return PrimaryAuthButton(
                    label: l10n.createAccount,
                    isLoading: isLoading,
                    onPressed: isLoading ? null : onSubmit,
                  );
                },
              ),
              const SizedBox(height: 20),

              // ── Or continue with ──────────────────────────────────────
              LoginSectionLabel(isDark: isDark, label: l10n.orContinueWith),
              const SizedBox(height: 14),

              BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (p, c) => c.maybeMap(
                  loading: (_) => true,
                  registerSuccess: (_) => true,
                  failure: (_) => true,
                  unauthenticated: (_) => true,
                  orElse: () => false,
                ),
                builder: (context, state) {
                  final isLoading = state.maybeMap(
                    loading: (_) => true,
                    orElse: () => false,
                  );
                  return GoogleSignInButton(
                    isLoading: isLoading,
                    onPressed: isLoading ? null : onGoogleSignIn,
                  );
                },
              ),
              const SizedBox(height: 28),

              // ── Login link ────────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${l10n.alreadyHaveAccount} ',
                    style: TextStyle(
                      color: isDark
                          ? AppColors.darkOnSurfaceVariant
                          : AppColors.grey500,
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Text(
                      l10n.signIn,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Role Selector ────────────────────────────────────────────────────────────

class _RoleSelector extends StatelessWidget {
  final UserRole selected;
  final ValueChanged<UserRole> onChanged;

  const _RoleSelector({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: _RoleCard(
            label: l10n.roleClient,
            subtitle: l10n.roleClientSubtitle,
            icon: Icons.business_center_outlined,
            isSelected: selected == UserRole.client,
            onTap: () => onChanged(UserRole.client),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _RoleCard(
            label: l10n.roleTechnician,
            subtitle: l10n.roleTechnicianSubtitle,
            icon: Icons.construction_outlined,
            isSelected: selected == UserRole.technician,
            onTap: () => onChanged(UserRole.technician),
          ),
        ),
      ],
    );
  }
}

class _RoleCard extends StatelessWidget {
  final String label;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleCard({
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primary.withValues(alpha: isDark ? 0.18 : 0.08)
            : (isDark ? AppColors.darkSurfaceVariant : AppColors.lightSurface),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected
              ? AppColors.primary
              : (isDark ? AppColors.grey700 : AppColors.grey200),
          width: isSelected ? 2 : 1,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : (isDark
                          ? AppColors.darkBackground
                          : AppColors.grey100),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 22,
                  color: isSelected
                      ? Colors.white
                      : (isDark ? AppColors.grey400 : AppColors.grey600),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: isSelected
                      ? AppColors.primary
                      : (isDark
                          ? AppColors.darkOnSurface
                          : AppColors.lightOnSurface),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 11,
                  color: isDark
                      ? AppColors.darkOnSurfaceVariant
                      : AppColors.lightOnSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
