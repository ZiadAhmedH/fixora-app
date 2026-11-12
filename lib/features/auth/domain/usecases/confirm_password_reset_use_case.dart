import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/forgot_password_repository.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Use Case: ConfirmPasswordResetUseCase
// ─────────────────────────────────────────────────────────────────────────────
// The FINAL step — actually changes the password in Firebase.
//
// Called from SetPasswordBloc when the user submits a valid new password
// on the Set New Password screen.
// ─────────────────────────────────────────────────────────────────────────────

class ConfirmPasswordResetUseCase {
  const ConfirmPasswordResetUseCase(this._repository);

  final ForgotPasswordRepository _repository;

  /// [oobCode]     — extracted from the deep-link URL query parameter.
  /// [newPassword] — the new password the user typed in the UI.
  Future<Either<Failure, Unit>> call({
    required String oobCode,
    required String newPassword,
  }) =>
      _repository.confirmPasswordReset(
        oobCode: oobCode,
        newPassword: newPassword,
      );
}

