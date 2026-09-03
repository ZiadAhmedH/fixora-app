import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/blocs/locale/locale_bloc.dart';

/// Section 1 — Gradient hero panel for the register screen.
class RegisterHeroSection extends StatelessWidget {
  final Size size;

  const RegisterHeroSection({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = context.select((LocaleBloc b) => b.state.locale);
    final isAr = locale.languageCode == 'ar';

    return Container(
      width: double.infinity,
      height: size.height * 0.28,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF00BFA6), Color(0xFF00897B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ── Language switcher pill ────────────────────────────────
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: _LanguageSwitcherButton(isAr: isAr),
              ),
              const SizedBox(height: 10),

              // ── Logo ─────────────────────────────────────────────
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: Image.asset(AppAssets.logo, fit: BoxFit.contain),
              ),
              const SizedBox(height: 12),

              // ── Title ────────────────────────────────────────────────
              Text(
                l10n.createAccount,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.2,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 4),

              // ── Subtitle ─────────────────────────────────────────────
              Text(
                l10n.joinPlatform,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withValues(alpha: 0.82),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Language Switcher Button ──────────────────────────────────────────────────

class _LanguageSwitcherButton extends StatelessWidget {
  final bool isAr;
  const _LanguageSwitcherButton({required this.isAr});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return GestureDetector(
      onTap: () {
        context.read<LocaleBloc>().add(
          LocaleEvent.change(languageCode: isAr ? 'en' : 'ar'),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.22),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.45),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.language_rounded, color: Colors.white, size: 16),
            const SizedBox(width: 6),
            Text(
              isAr ? l10n.switchToEnglish : l10n.switchToArabic,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
