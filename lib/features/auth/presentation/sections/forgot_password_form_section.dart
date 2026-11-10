import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/forgot_password_bloc.dart';
import '../bloc/forgot_password_event.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_auth_button.dart';
import 'login_section_label.dart';

/// The scrollable form card below the hero — mirrors the structure of
/// [LoginFormSection] and [RegisterFormSection].
class ForgotPasswordFormSection extends StatelessWidget {
  final bool isDark;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailCtrl;
  final ResetMethod selectedMethod;
  final bool isLoading;
  final VoidCallback onSubmit;

  const ForgotPasswordFormSection({
    super.key,
    required this.isDark,
    required this.formKey,
    required this.emailCtrl,
    required this.selectedMethod,
    required this.isLoading,
    required this.onSubmit,
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
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Send reset code via ───────────────────────────────
              LoginSectionLabel(
                isDark: isDark,
                label: l10n.sendResetCodeVia,
              ),
              const SizedBox(height: 12),
              _MethodSelector(isDark: isDark, selected: selectedMethod),
              const SizedBox(height: 22),

              // ── Account credentials ───────────────────────────────
              LoginSectionLabel(
                isDark: isDark,
                label: l10n.accountCredentials,
              ),
              const SizedBox(height: 14),

              AuthTextField(
                label: l10n.email,
                hint: l10n.registeredEmailHint,
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return l10n.enterYourEmail;
                  }
                  if (!v.contains('@') || !v.contains('.')) {
                    return l10n.invalidEmail;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),

              Text(
                l10n.registeredEmailNote,
                style: TextStyle(
                  fontSize: 12,
                  color: isDark
                      ? AppColors.darkOnSurfaceVariant
                      : AppColors.lightOnSurfaceVariant,
                ),
              ),
              const SizedBox(height: 24),

              // ── Send instructions button ───────────────────────────
              PrimaryAuthButton(
                label: l10n.sendResetInstructions,
                isLoading: isLoading,
                onPressed: isLoading ? null : onSubmit,
              ),
              const SizedBox(height: 28),

              // ── Having trouble? ───────────────────────────────────
              LoginSectionLabel(isDark: isDark, label: l10n.havingTrouble),
              const SizedBox(height: 12),

              _SupportTile(isDark: isDark),
              const SizedBox(height: 28),

              // ── Remember password? Sign In ─────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${l10n.rememberPassword} ',
                    style: TextStyle(
                      fontSize: 13,
                      color: isDark
                          ? AppColors.darkOnSurfaceVariant
                          : AppColors.grey500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text(
                      l10n.signIn,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
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

// ── Method Selector ───────────────────────────────────────────────────────────

class _MethodSelector extends StatelessWidget {
  final bool isDark;
  final ResetMethod selected;

  const _MethodSelector({required this.isDark, required this.selected});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: _MethodCard(
            isDark: isDark,
            icon: Icons.email_outlined,
            label: l10n.emailAddress,
            subtitle: l10n.instantMagicLink,
            isSelected: selected == ResetMethod.email,
            onTap: () => context.read<ForgotPasswordBloc>().add(
                  const ForgotPasswordEvent.methodChanged(
                      method: ResetMethod.email),
                ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _MethodCard(
            isDark: isDark,
            icon: Icons.phone_android_outlined,
            label: l10n.phoneSms,
            subtitle: l10n.sixDigitOtp,
            isSelected: selected == ResetMethod.phone,
            onTap: () => context.read<ForgotPasswordBloc>().add(
                  const ForgotPasswordEvent.methodChanged(
                      method: ResetMethod.phone),
                ),
          ),
        ),
      ],
    );
  }
}

class _MethodCard extends StatelessWidget {
  final bool isDark;
  final IconData icon;
  final String label;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _MethodCard({
    required this.isDark,
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
                  size: 20,
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
                  fontSize: 13,
                  color: isSelected
                      ? AppColors.primary
                      : (isDark
                          ? AppColors.darkOnSurface
                          : AppColors.lightOnSurface),
                ),
                textAlign: TextAlign.center,
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

// ── Support Tile ──────────────────────────────────────────────────────────────

class _SupportTile extends StatelessWidget {
  final bool isDark;
  const _SupportTile({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceVariant : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark ? AppColors.grey700 : AppColors.grey200,
        ),
      ),
      child: ListTile(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        onTap: () {/* TODO: open support channel */},
        leading: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.headset_mic_outlined,
            color: AppColors.primary,
            size: 20,
          ),
        ),
        title: Text(
          l10n.contactSupport,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13,
            color:
                isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface,
          ),
        ),
        subtitle: Text(
          l10n.supportAvailability,
          style: TextStyle(
            fontSize: 11,
            color: isDark
                ? AppColors.darkOnSurfaceVariant
                : AppColors.lightOnSurfaceVariant,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: isDark ? AppColors.grey500 : AppColors.grey400,
          size: 20,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
    );
  }
}
