import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_event.freezed.dart';

@freezed
sealed class ForgotPasswordEvent with _$ForgotPasswordEvent {
  /// User selected a reset method (email or phone).
  const factory ForgotPasswordEvent.methodChanged({
    required ResetMethod method,
  }) = _MethodChanged;

  /// User submitted the email to send reset instructions.
  const factory ForgotPasswordEvent.sendRequested({
    required String email,
  }) = _SendRequested;

  /// Reset BLoC back to initial (e.g. after success dialog dismissed).
  const factory ForgotPasswordEvent.resetState() = _ResetState;
}

enum ResetMethod { email, phone }

