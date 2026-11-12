import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ForgotPasswordRepository — Domain Contract
// ─────────────────────────────────────────────────────────────────────────────
//
// WHY THIS EXISTS:
//   The domain layer should never depend on Firebase directly.
//   This interface hides how the reset actually works (Firebase, REST, etc.)
//   so the BLoC only calls use-cases which call this interface.
//
// METHODS:
//   • sendPasswordResetEmail  → Step 1: asks Firebase to send the reset link
//   • confirmPasswordReset    → Step 2: applies the new password using the
//                               one-time code (oobCode) extracted from the
//                               deep-link URL that opened the app.
//   • verifyResetCode         → Optional Step 2a: validates the oobCode
//                               BEFORE showing the new-password screen, so
//                               we can catch expired/already-used codes early.
//
// FLOW OVERVIEW:
//   User enters email
//       ↓  sendPasswordResetEmail(email)
//   Firebase sends email with a link (e.g. https://yourapp.page.link/reset?oobCode=XYZ)
//       ↓  user taps the link on their device
//   Android/iOS deep-link opens YOUR Flutter app
//       ↓  GoRouter reads the URL → extracts oobCode from query params
//   verifyResetCode(oobCode) → confirm the code is still valid
//       ↓
//   User sees Set New Password screen (your Flutter UI)
//       ↓  confirmPasswordReset(oobCode, newPassword)
//   Firebase updates the password ✅
// ─────────────────────────────────────────────────────────────────────────────

abstract interface class ForgotPasswordRepository {
  /// STEP 1 — Sends a password-reset email to [email].
  ///
  /// Firebase sends a link that, when configured with [ActionCodeSettings]
  /// and [handleCodeInApp: true], will re-open this Flutter app instead of
  /// a browser page. The link contains an [oobCode] (out-of-band code) in
  /// its query parameters.
  Future<Either<Failure, Unit>> sendPasswordResetEmail(String email);

  /// STEP 2a (Optional Guard) — Validates the [oobCode] from the deep link.
  ///
  /// Call this BEFORE showing the Set New Password screen to make sure the
  /// code has not expired (default: 1 hour) or already been used.
  /// Returns the email address the reset was originally sent to, so you can
  /// display it in the UI (e.g. "Resetting password for user@example.com").
  Future<Either<Failure, String>> verifyResetCode(String oobCode);

  /// STEP 2b — Applies the new password using the [oobCode] from the link.
  ///
  /// This is the final Firebase call that actually changes the password.
  /// After this succeeds, the [oobCode] is consumed and cannot be reused.
  Future<Either<Failure, Unit>> confirmPasswordReset({
    required String oobCode,
    required String newPassword,
  });
}
