import 'package:freezed_annotation/freezed_annotation.dart';

import 'forgot_password_event.dart';

part 'forgot_password_state.freezed.dart';

@freezed
sealed class ForgotPasswordState with _$ForgotPasswordState {
  /// Idle — waiting for user input.
  const factory ForgotPasswordState.initial({
    @Default(ResetMethod.email) ResetMethod method,
  }) = _Initial;

  /// Email is being sent to Firebase.
  const factory ForgotPasswordState.loading({
    @Default(ResetMethod.email) ResetMethod method,
  }) = _Loading;

  /// Firebase returned success — email was sent.
  const factory ForgotPasswordState.success({
    @Default(ResetMethod.email) ResetMethod method,
  }) = _Success;

  /// A Firebase or network error occurred.
  const factory ForgotPasswordState.failure({
    required String message,
    @Default(ResetMethod.email) ResetMethod method,
  }) = _Failure;
}
