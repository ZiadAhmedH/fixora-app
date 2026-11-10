import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/blocs/locale/locale_bloc.dart';

/// Green gradient hero identical in structure to [LoginHeroSection].
class ForgotPasswordHeroSection extends StatelessWidget {
  final bool isDark;
  const ForgotPasswordHeroSection({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = context.select((LocaleBloc b) => b.state.locale);
    final isAr = locale.languageCode == 'ar';

    final mq = MediaQuery.of(context);
    final sh = mq.size.height;

    final logoSize = (sh * 0.10).clamp(44.0, 64.0);
    final gapSmall = (sh * 0.010).clamp(4.0, 10.0);
    final gapMedium = (sh * 0.014).clamp(6.0, 14.0);
    final titleSize = (sh * 0.030).clamp(18.0, 24.0);
    final subtitleSize = (sh * 0.016).clamp(11.0, 13.0);

    return Container(
      width: double.infinity,
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
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: (sh * 0.016).clamp(10.0, 18.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── Language switcher ─────────────────────────────────
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: _LanguageSwitcher(isAr: isAr),
              ),
              SizedBox(height: gapSmall),

              // ── Logo ──────────────────────────────────────────────
              Container(
                width: logoSize,
                height: logoSize,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(logoSize * 0.28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(logoSize * 0.14),
                child: Image.asset(AppAssets.logo, fit: BoxFit.contain),
              ),
              SizedBox(height: gapMedium),

              // ── Title ─────────────────────────────────────────────
              Text(
                l10n.forgotPasswordTitle,
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.2,
                  letterSpacing: -0.3,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: gapSmall),

              // ── Subtitle ──────────────────────────────────────────
              Text(
                l10n.forgotPasswordSubtitle,
                style: TextStyle(
                  fontSize: subtitleSize,
                  color: Colors.white.withValues(alpha: 0.85),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: gapSmall * 0.5),
              Text(
                l10n.forgotPasswordBody,
                style: TextStyle(
                  fontSize: subtitleSize,
                  color: Colors.white.withValues(alpha: 0.70),
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

class _LanguageSwitcher extends StatelessWidget {
  final bool isAr;
  const _LanguageSwitcher({required this.isAr});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return GestureDetector(
      onTap: () => context.read<LocaleBloc>().add(
            LocaleEvent.change(languageCode: isAr ? 'en' : 'ar'),
          ),
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
