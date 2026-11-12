abstract final class RouteNames {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // ── Password Reset Deep Link Route ─────────────────────────────────────────
  // This route is opened when the user taps the Firebase reset email link.
  // The OS intercepts the link URL and routes it here via Android App Links
  // or iOS Universal Links. GoRouter extracts [oobCode] from the URL.
  // Example URL: https://yourapp.page.link/reset?oobCode=XYZ&mode=resetPassword
  static const String setNewPassword = '/set-new-password';
  // ──────────────────────────────────────────────────────────────────────────

  static const String home = '/';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String notifications = '/notifications';
}
