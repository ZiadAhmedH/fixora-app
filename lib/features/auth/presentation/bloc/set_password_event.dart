import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_password_event.freezed.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SetPasswordEvent — What the UI can tell the BLoC to do
// ─────────────────────────────────────────────────────────────────────────────

@freezed
sealed class SetPasswordEvent with _$SetPasswordEvent {
  /// Fired when the page first loads after the deep link opens the app.
  /// [oobCode] comes from the URL query parameter.
  /// The BLoC calls [VerifyResetCodeUseCase] immediately so we know the
  /// code is valid before the user types anything.
  const factory SetPasswordEvent.started({
    required String oobCode,
  }) = _Started;

  /// Fired on every keystroke in the password field.
  /// Used to live-evaluate the password strength requirements shown in the UI.
  const factory SetPasswordEvent.passwordChanged({
    required String password,
    required String confirm,
  }) = _PasswordChanged;

  /// Fired when the user taps "Reset Password".
  const factory SetPasswordEvent.submitted({
    required String password,
    required String confirm,
  }) = _Submitted;
}

