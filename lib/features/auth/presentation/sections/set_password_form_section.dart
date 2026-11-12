import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../bloc/set_password_state.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/primary_auth_button.dart';
import 'login_section_label.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SetPasswordFormSection
// ─────────────────────────────────────────────────────────────────────────────
//
// The scrollable card below the green hero — contains:
//   • Security Details section: two password fields (new + confirm)
//   • Password Requirements: live-updating checklist (8 chars, mixed case,
//     number/symbol). Each row turns green when the rule passes.
//   • Reset Password button: disabled until all requirements are met
//     AND the two password fields match.
//   • Having Trouble: support tile
//   • Bottom link: Remember your password? Sign In
//
// LIVE VALIDATION:
//   [onPasswordChanged] is called on every keystroke. It fires
//   [SetPasswordEvent.passwordChanged] which causes the BLoC to re-evaluate
//   [PasswordRequirements] and emit a new [ready] state. This widget then
//   rebuilds and updates the requirement rows.
// ─────────────────────────────────────────────────────────────────────────────

class SetPasswordFormSection extends StatelessWidget {
  final bool isDark;
  final GlobalKey<FormState> formKey;
  final String email;
  final TextEditingController passwordCtrl;
  final TextEditingController confirmCtrl;
  final PasswordRequirements requirements;
  final bool isLoading;
  final VoidCallback onPasswordChanged;
  final VoidCallback onSubmit;

  const SetPasswordFormSection({
    super.key,
    required this.isDark,
    required this.formKey,
    required this.email,
    required this.passwordCtrl,
    required this.confirmCtrl,
    required this.requirements,
    required this.isLoading,
    required this.onPasswordChanged,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cardColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;

    // The Reset Password button is active only when ALL requirements are met
    // AND both password fields have matching values.
    final canSubmit =
        requirements.isValid && passwordCtrl.text == confirmCtrl.text;

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
              // ── Security Details Section ──────────────────────────
              LoginSectionLabel(
                isDark: isDark,
                label: l10n.securityDetails,
              ),
              const SizedBox(height: 14),

              // New Password field
              AuthTextField(
                label: l10n.newPassword,
                hint: '••••••••',
                controller: passwordCtrl,
                isPassword: true,
                prefixIcon: Icons.lock_outline,
                // Live update the requirements display on every keystroke.
                onChanged: (_) => onPasswordChanged(),
                validator: (v) {
                  if (v == null || v.isEmpty) return l10n.enterAPassword;
                  if (!PasswordRequirements.evaluate(v).isValid) {
                    return l10n.passwordRequirementsNotMet;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Confirm Password field
              AuthTextField(
                label: l10n.confirmPassword,
                hint: '••••••••',
                controller: confirmCtrl,
                isPassword: true,
                prefixIcon: Icons.lock_outline,
                onChanged: (_) => onPasswordChanged(),
                validator: (v) {
                  if (v == null || v.isEmpty) return l10n.confirmYourPassword;
                  if (v != passwordCtrl.text) return l10n.passwordsDoNotMatch;
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // ── Password Requirements Checklist ───────────────────
              // Each row shows a ✓ (green) or • (grey) depending on whether
              // the user's current input satisfies that rule.
              // This section is rebuilt on every [onPasswordChanged] call.
              _RequirementsSection(
                isDark: isDark,
                requirements: requirements,
              ),
              const SizedBox(height: 24),

              // ── Reset Password Button ─────────────────────────────
              // Disabled until [canSubmit] is true (all rules pass + match).
              PrimaryAuthButton(
                label: l10n.resetPassword,
                isLoading: isLoading,
                onPressed: (isLoading || !canSubmit) ? null : onSubmit,
              ),
              const SizedBox(height: 28),

              // ── Having Trouble? ───────────────────────────────────
              LoginSectionLabel(isDark: isDark, label: l10n.havingTrouble),
              const SizedBox(height: 12),
              _SupportTile(isDark: isDark),
              const SizedBox(height: 28),

              // ── Remember your password? Sign In ───────────────────
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
                    onTap: () => context.pop(),
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

// ── Password Requirements Checklist ──────────────────────────────────────────

class _RequirementsSection extends StatelessWidget {
  final bool isDark;
  final PasswordRequirements requirements;

  const _RequirementsSection({
    required this.isDark,
    required this.requirements,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurfaceVariant : AppColors.grey50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? AppColors.grey700 : AppColors.grey200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            l10n.passwordRequirements,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              color: isDark
                  ? AppColors.darkOnSurfaceVariant
                  : AppColors.lightOnSurfaceVariant,
            ),
          ),
          const SizedBox(height: 10),

          // Requirement rows — green ✓ when met, grey dot when not
          _RequirementRow(
            label: l10n.reqMinLength,
            met: requirements.hasMinLength,
          ),
          const SizedBox(height: 6),
          _RequirementRow(
            label: l10n.reqMixedCase,
            met: requirements.hasMixedCase,
          ),
          const SizedBox(height: 6),
          _RequirementRow(
            label: l10n.reqNumberOrSymbol,
            met: requirements.hasNumberOrSymbol,
          ),
        ],
      ),
    );
  }
}

class _RequirementRow extends StatelessWidget {
  final String label;
  final bool met;

  const _RequirementRow({required this.label, required this.met});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: Row(
        key: ValueKey(met), // triggers animation when [met] changes
        children: [
          // Icon: green checkmark when met, grey dot when not
          Icon(
            met ? Icons.check_circle : Icons.circle_outlined,
            size: 16,
            color: met ? AppColors.success : AppColors.grey400,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: met ? AppColors.success : AppColors.grey500,
              fontWeight: met ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
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
            color: isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface,
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

