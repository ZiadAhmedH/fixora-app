import 'package:flutter/material.dart';

/// Central color palette for the app.
/// All colors are defined here — never hardcode colors elsewhere.
abstract final class AppColors {
  // ── Brand / Primary ───────────────────────────────────────
  static const Color primary = Color(0xFF00BFA6);        // teal
  static const Color primaryLight = Color(0xFFA7F3D0);   // mint
  static const Color primaryDark = Color(0xFF00897B);    // dark teal

  // ── Secondary / Accent ────────────────────────────────────
  static const Color secondary = Color(0xFF00BFA6);      // teal
  static const Color secondaryLight = Color(0xFFA7F3D0); // mint
  static const Color secondaryDark = Color(0xFF00695C);  // deep teal

  // ── Semantic ──────────────────────────────────────────────
  static const Color success = Color(0xFF2E7D32);
  static const Color successLight = Color(0xFFE8F5E9);
  static const Color warning = Color(0xFFF57F17);
  static const Color warningLight = Color(0xFFFFF8E1);
  static const Color error = Color(0xFFC62828);
  static const Color errorLight = Color(0xFFFFEBEE);
  static const Color info = Color(0xFF0277BD);
  static const Color infoLight = Color(0xFFE1F5FE);

  // ── Neutral ───────────────────────────────────────────────
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  // ── Light Theme Surfaces ──────────────────────────────────
  static const Color lightBackground = Color(0xFFF8F9FD);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFF0F2F8);
  static const Color lightOnSurface = Color(0xFF1A1C1E);
  static const Color lightOnSurfaceVariant = Color(0xFF44464F);

  // ── Dark Theme Surfaces ───────────────────────────────────
  static const Color darkBackground = Color(0xFF0F1117);
  static const Color darkSurface = Color(0xFF1A1D27);
  static const Color darkSurfaceVariant = Color(0xFF252836);
  static const Color darkOnSurface = Color(0xFFE2E2E9);
  static const Color darkOnSurfaceVariant = Color(0xFFC5C6D0);

  // ── Utility ───────────────────────────────────────────────
  static const Color transparent = Colors.transparent;
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color divider = Color(0x1F000000);
  static const Color dividerDark = Color(0x1FFFFFFF);
}
