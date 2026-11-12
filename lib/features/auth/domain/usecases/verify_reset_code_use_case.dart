import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/forgot_password_repository.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Use Case: VerifyResetCodeUseCase
// ─────────────────────────────────────────────────────────────────────────────
// Called when the app is opened via the deep link.
// Validates the oobCode BEFORE showing the Set New Password screen.
//
// WHY IT MATTERS (Security):
//   • oobCodes expire after ~1 hour.
//   • Once used they are invalidated server-side.
//   • Verifying first prevents the user from typing a full new password
//     only to discover the code is expired after they hit "Reset".
// ─────────────────────────────────────────────────────────────────────────────

class VerifyResetCodeUseCase {
  const VerifyResetCodeUseCase(this._repository);

  final ForgotPasswordRepository _repository;

  /// Returns the email address the reset was originally requested for.
  /// The UI can display this to confirm the user is resetting the right account.
  Future<Either<Failure, String>> call(String oobCode) =>
      _repository.verifyResetCode(oobCode);
}

