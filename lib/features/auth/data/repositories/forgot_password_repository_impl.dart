import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/repositories/forgot_password_repository.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ForgotPasswordRepositoryImpl — Data Layer (Firebase)
// ─────────────────────────────────────────────────────────────────────────────
//
// This is the ONLY place in the app that calls Firebase Auth APIs for the
// forgot-password flow. Everything above this layer (domain, presentation)
// is completely unaware of Firebase.
//
// DEEP LINK SETUP (must be done once per platform):
// ─────────────────────────────────────────────────
//   The email link opens your Flutter app ONLY when you:
//
//   1) Pass [ActionCodeSettings] with:
//        url              → your registered deep-link URL
//        handleCodeInApp  → true  (crucial flag)
//        androidPackageName / iOSBundleId → your app identifiers
//
//   2) Configure the platform:
//        Android: add an <intent-filter> in AndroidManifest.xml
//        iOS:     add an Associated Domain + configure Info.plist
//        (see /docs/deep_link_setup.md for details)
//
//   3) Handle the incoming URL in AppRouter (see app_router.dart).
//      GoRouter reads the URL, extracts the oobCode query param,
//      and navigates to SetNewPasswordPage automatically.
//
// ERROR MAPPING:
//   Firebase throws [FirebaseAuthException] with an error code string.
//   We map those to our [Failure] sealed class so the domain and
//   presentation layers never depend on Firebase types.
// ─────────────────────────────────────────────────────────────────────────────

// ── App Deep-Link Configuration ──────────────────────────────────────────────
// Live Firebase Hosting domain with verified assetlinks.json
const _kDeepLinkUrl = 'https://field-service-app-1145a.web.app/set-new-password';

// Bundle identifiers matching build.gradle.kts and Xcode project
const _kAndroidPackageName = 'com.ziadahmed.feild_service_app';
const _kIosBundleId = 'com.ziadahmed.feildServiceApp';
// ─────────────────────────────────────────────────────────────────────────────

final class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  const ForgotPasswordRepositoryImpl(this._auth);

  final FirebaseAuth _auth;

  // ── STEP 1: Send the reset email ───────────────────────────────────────────

  @override
  Future<Either<Failure, Unit>> sendPasswordResetEmail(String email) async {
    try {
      // [ActionCodeSettings] tells Firebase HOW to construct the link in the email:
      //   • url             → the base URL that will be turned into a deep link.
      //                       When the user taps the link, the OS checks if any
      //                       installed app claims this URL (via App Links / Universal Links).
      //                       If your app does, it opens instead of a browser.
      //   • handleCodeInApp → the most important flag. When true, Firebase embeds
      //                       the oobCode as a query parameter in the link URL so
      //                       your app can extract and use it.
      //   • androidInstallApp → if the app is not installed, redirect to Play Store.
      await _auth.sendPasswordResetEmail(
        email: email,
        actionCodeSettings: ActionCodeSettings(
          url: _kDeepLinkUrl,
          handleCodeInApp: true, // ← makes the link open the Flutter app
          androidPackageName: _kAndroidPackageName,
          androidInstallApp: true,
          androidMinimumVersion: '21',
          iOSBundleId: _kIosBundleId,
        ),
      );
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.server(message: _mapAuthError(e.code)));
    } catch (_) {
      return const Left(
        Failure.unexpected(message: 'Could not send reset email. Try again.'),
      );
    }
  }

  // ── STEP 2a: Validate the oobCode from the deep link ──────────────────────

  @override
  Future<Either<Failure, String>> verifyResetCode(String oobCode) async {
    try {
      // [checkActionCode] asks Firebase: "Is this code valid?"
      //   • Returns [ActionCodeInfo] which includes the email it was sent to.
      //   • Throws FirebaseAuthException if the code is expired or invalid.
      //
      // We call this as soon as the app opens from the deep link, BEFORE
      // showing the Set New Password screen. This way the user gets an
      // early error instead of filling in a password and then failing.
      final info = await _auth.checkActionCode(oobCode);

      // [info.data.email] is the email the reset was originally requested for.
      // We return it so the UI can display "Resetting password for user@example.com".
      final email = (info.data['email'] as String?) ?? '';
      return Right(email);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.server(message: _mapAuthError(e.code)));
    } catch (_) {
      return const Left(
        Failure.unexpected(message: 'Could not verify reset code.'),
      );
    }
  }

  // ── STEP 2b: Apply the new password ───────────────────────────────────────

  @override
  Future<Either<Failure, Unit>> confirmPasswordReset({
    required String oobCode,
    required String newPassword,
  }) async {
    try {
      // [confirmPasswordReset] is the final Firebase call.
      // It takes the one-time [oobCode] and the user's new password.
      // After this call succeeds:
      //   • The password is updated in Firebase Auth.
      //   • The oobCode is INVALIDATED — it cannot be reused.
      //   • The user is NOT automatically signed in. They must log in again
      //     with the new password (we redirect to the login screen).
      await _auth.confirmPasswordReset(
        code: oobCode,
        newPassword: newPassword,
      );
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(Failure.server(message: _mapAuthError(e.code)));
    } catch (_) {
      return const Left(
        Failure.unexpected(message: 'Could not reset password. Try again.'),
      );
    }
  }

  // ── Error Code Mapping ────────────────────────────────────────────────────

  /// Maps Firebase error codes to user-friendly messages.
  /// We do this in the data layer so the domain and UI stay Firebase-free.
  String _mapAuthError(String code) => switch (code) {
        // oobCode issues
        'expired-action-code' =>
          'This reset link has expired. Please request a new one.',
        'invalid-action-code' =>
          'This reset link is invalid or has already been used.',
        // Email issues
        'user-not-found' => 'No account found with this email address.',
        'invalid-email' => 'Please enter a valid email address.',
        'user-disabled' => 'This account has been disabled. Contact support.',
        // Password issues
        'weak-password' =>
          'Password is too weak. Use at least 8 characters with mixed case.',
        // Network
        'network-request-failed' =>
          'No internet connection. Please check your network.',
        'too-many-requests' =>
          'Too many attempts. Please wait a moment and try again.',
        _ => 'Authentication failed. Please try again.',
      };
}
