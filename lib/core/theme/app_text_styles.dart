import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Centralized text style definitions.
/// Always use these instead of inline TextStyle declarations.
abstract final class AppTextStyles {
  // ── Display ───────────────────────────────────────────────
  static const TextStyle displayLarge = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    color: AppColors.grey900,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 45,
    fontWeight: FontWeight.w400,
    color: AppColors.grey900,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: AppColors.grey900,
  );

  // ── Headline ──────────────────────────────────────────────
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.grey900,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.grey900,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.grey900,
  );

  // ── Title ─────────────────────────────────────────────────
  static const TextStyle titleLarge = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.grey900,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    color: AppColors.grey900,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: AppColors.grey900,
  );

  // ── Body ──────────────────────────────────────────────────
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: AppColors.grey800,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: AppColors.grey800,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: AppColors.grey700,
  );

  // ── Label ─────────────────────────────────────────────────
  static const TextStyle labelLarge = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: AppColors.grey900,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: AppColors.grey700,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: AppColors.grey600,
  );
}
