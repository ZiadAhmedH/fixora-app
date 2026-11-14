import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/app_user.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/google_sign_in_button.dart';
import '../widgets/primary_auth_button.dart';
import 'login_section_label.dart';

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
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppConstants.maxFormWidth,
            ),
            child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginSectionLabel(isDark: isDark, label: l10n.iAmRegisteringAs),
              const SizedBox(height: 12),
              _RoleSelector(selected: selectedRole, onChanged: onRoleChanged),
              const SizedBox(height: 22),

              LoginSectionLabel(isDark: isDark, label: l10n.accountDetails),
              const SizedBox(height: 14),

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

              AuthTextField(
                label: l10n.email,
                hint: AppConstants.emailHint,
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

              AuthTextField(
                label: l10n.password,
                hint: AppConstants.passwordMaskHint,
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

              AuthTextField(
                label: l10n.confirmPassword,
                hint: AppConstants.passwordMaskHint,
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
            ],
          ),
        ),
      ),
    ),
  ),
);
  }
}

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
            icon: Icons.person_outline,
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

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: isDark ? 0.18 : 0.10)
              : (isDark ? AppColors.darkSurfaceVariant : AppColors.grey50),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : (isDark ? AppColors.grey700 : AppColors.grey200),
            width: isSelected ? 1.8 : 1.0,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected
                  ? AppColors.primary
                  : (isDark
                      ? AppColors.darkOnSurfaceVariant
                      : AppColors.lightOnSurfaceVariant),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
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
    );
  }
}
