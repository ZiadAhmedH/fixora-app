import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_password_state.freezed.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SetPasswordState — Every possible UI state for the Set New Password screen
// ─────────────────────────────────────────────────────────────────────────────
//
// STATE MACHINE:
//
//   initial
//     ↓  started event
//   validating (checking oobCode with Firebase)
//     ↓  code OK
//   ready(email, requirements)   ← user types password here
//     ↓  submitted event
//   loading
//     ↓  Firebase confirmPasswordReset succeeds
//   success
//     ↓  or fails
//   failure (stays in ready — snackbar shown, form not reset)
//
//   OR if code is expired/invalid:
//   validating → codeError (show error + "request new link" button)
// ─────────────────────────────────────────────────────────────────────────────

@freezed
sealed class SetPasswordState with _$SetPasswordState {
  /// App just opened from the deep link — checking the oobCode with Firebase.
  const factory SetPasswordState.validating() = _Validating;

  /// oobCode is valid — show the form. [email] is displayed so the user
  /// knows which account they are resetting.
  const factory SetPasswordState.ready({
    required String email,
    required String oobCode,
    @Default(PasswordRequirements()) PasswordRequirements requirements,
  }) = _Ready;

  /// "Reset Password" button was tapped — Firebase call in progress.
  const factory SetPasswordState.loading({
    required String email,
    required String oobCode,
    required PasswordRequirements requirements,
  }) = _Loading;

  /// Firebase confirmPasswordReset succeeded — navigate to login.
  const factory SetPasswordState.success() = _Success;

  /// oobCode is expired or already used — cannot proceed.
  const factory SetPasswordState.codeError({
    required String message,
  }) = _CodeError;

  /// confirmPasswordReset failed (weak password, network error, etc.)
  /// We keep [email] and [oobCode] so the user can try again.
  const factory SetPasswordState.failure({
    required String message,
    required String email,
    required String oobCode,
    required PasswordRequirements requirements,
  }) = _Failure;
}

// ─────────────────────────────────────────────────────────────────────────────
// PasswordRequirements — Live validation model shown in the UI
// ─────────────────────────────────────────────────────────────────────────────
//
// Each field is a boolean that the UI renders as a green ✓ or grey dot.
// Updated on every [passwordChanged] event so feedback is instant.
// ─────────────────────────────────────────────────────────────────────────────

class PasswordRequirements {
  /// At least 8 characters long.
  final bool hasMinLength;

  /// Contains both uppercase AND lowercase letters.
  final bool hasMixedCase;

  /// Contains at least one digit or special character.
  final bool hasNumberOrSymbol;

  const PasswordRequirements({
    this.hasMinLength = false,
    this.hasMixedCase = false,
    this.hasNumberOrSymbol = false,
  });

  /// All requirements met → the form can be submitted.
  bool get isValid => hasMinLength && hasMixedCase && hasNumberOrSymbol;

  /// Factory: evaluates [password] against all rules.
  factory PasswordRequirements.evaluate(String password) {
    return PasswordRequirements(
      hasMinLength: password.length >= 8,
      hasMixedCase:
          password.contains(RegExp(r'[A-Z]')) &&
          password.contains(RegExp(r'[a-z]')),
      hasNumberOrSymbol:
          password.contains(RegExp(r'[0-9]')) ||
          password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_\-]')),
    );
  }
}

