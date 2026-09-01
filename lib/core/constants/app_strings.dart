/// Keys that map 1-to-1 with ARB translation keys.
///
/// Usage:
/// ```dart
/// Text(context.tr(AppStrings.appName))
/// // or via generated localizations:
/// Text(AppLocalizations.of(context).appName)
/// ```
///
/// Never hard-code user-facing strings in widgets.
abstract final class AppStrings {
  // ── App ───────────────────────────────────────────────────
  static const String appName = 'appName';

  // ── Common / Actions ──────────────────────────────────────
  static const String ok = 'ok';
  static const String cancel = 'cancel';
  static const String confirm = 'confirm';
  static const String save = 'save';
  static const String delete = 'delete';
  static const String edit = 'edit';
  static const String add = 'add';
  static const String search = 'search';
  static const String filter = 'filter';
  static const String retry = 'retry';
  static const String close = 'close';
  static const String back = 'back';
  static const String next = 'next';
  static const String done = 'done';
  static const String loading = 'loading';
  static const String submit = 'submit';

  // ── Auth ──────────────────────────────────────────────────
  static const String login = 'login';
  static const String logout = 'logout';
  static const String register = 'register';
  static const String email = 'email';
  static const String password = 'password';
  static const String forgotPassword = 'forgotPassword';
  static const String username = 'username';

  // ── Errors ────────────────────────────────────────────────
  static const String errorGeneral = 'errorGeneral';
  static const String errorNetwork = 'errorNetwork';
  static const String errorServer = 'errorServer';
  static const String errorUnauthorized = 'errorUnauthorized';
  static const String errorNotFound = 'errorNotFound';
  static const String errorTimeout = 'errorTimeout';
  static const String errorValidationRequired = 'errorValidationRequired';
  static const String errorValidationEmail = 'errorValidationEmail';
  static const String errorValidationPassword = 'errorValidationPassword';

  // ── Navigation / Labels ───────────────────────────────────
  static const String navHome = 'navHome';
  static const String navProfile = 'navProfile';
  static const String navSettings = 'navSettings';
  static const String navNotifications = 'navNotifications';

  // ── Settings ──────────────────────────────────────────────
  static const String settings = 'settings';
  static const String theme = 'theme';
  static const String themeLight = 'themeLight';
  static const String themeDark = 'themeDark';
  static const String themeSystem = 'themeSystem';
  static const String language = 'language';
  static const String languageEnglish = 'languageEnglish';
  static const String languageArabic = 'languageArabic';

  // ── Empty States ──────────────────────────────────────────
  static const String emptyStateDefault = 'emptyStateDefault';
  static const String emptyStateSearch = 'emptyStateSearch';
  static const String emptyStateNotifications = 'emptyStateNotifications';
}
