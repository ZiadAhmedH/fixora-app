/// App-wide general constants.
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'Fixora';
  static const String appVersion = '1.0.0';

  // Responsive Layout Constraints
  static const double maxFormWidth = 500.0;

  // UI Input Hints & Static Values
  static const String emailHint = 'you@example.com';
  static const String passwordMaskHint = '••••••••';
  static const String supportEmail = 'support@fixora.com';
  static const String supportPhone = '+966 800 FIXORA';

  // ── Network ───────────────────────────────────────────────
  static const String baseUrl = 'https://api.example.com/v1';
  static const int connectTimeoutMs = 15000;
  static const int receiveTimeoutMs = 15000;

  // ── Cache ─────────────────────────────────────────────────
  static const String cachedUserKey = 'CACHED_USER';
  static const String themeKey = 'APP_THEME';
  static const String localeKey = 'APP_LOCALE';

  // ── Default Locale ────────────────────────────────────────
  static const String defaultLocale = 'en';

  // ── Spacing & Layout ─────────────────────────────────────
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;
  static const double paddingXXL = 48.0;

  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 24.0;
  static const double radiusFull = 100.0;

  // ── Animation Durations ───────────────────────────────────
  static const Duration animFast = Duration(milliseconds: 150);
  static const Duration animMedium = Duration(milliseconds: 300);
  static const Duration animSlow = Duration(milliseconds: 500);
}
