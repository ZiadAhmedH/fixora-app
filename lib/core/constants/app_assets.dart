/// Central asset path manifest.
///
/// Use these constants instead of raw string literals so that:
/// - Renaming/moving an asset only requires a change in one place.
/// - IDEs can find all usages via "Find references".
/// - Typos are caught at analysis time rather than at runtime.
abstract final class AppAssets {
  // ── Images ────────────────────────────────────────────────
  static const String logo = 'assets/images/fixora.png';

  // ── Lottie Animations ─────────────────────────────────────
  // static const String splashLottie = 'assets/lottie/splash.json';

  // ── Icons (SVG / PNG) ─────────────────────────────────────
  // static const String googleIcon = 'assets/icons/google.svg';
}
