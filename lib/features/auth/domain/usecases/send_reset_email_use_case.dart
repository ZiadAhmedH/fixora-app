import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/forgot_password_repository.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Use Case: SendResetEmailUseCase
// ─────────────────────────────────────────────────────────────────────────────
// Responsibility: single entry point for "send the reset email" action.
// The BLoC calls this — it never talks to the repository directly.
// ─────────────────────────────────────────────────────────────────────────────

class SendResetEmailUseCase {
  const SendResetEmailUseCase(this._repository);

  final ForgotPasswordRepository _repository;

  /// Delegates to the repository. Trimming is done here so callers
  /// never have to remember to strip whitespace.
  Future<Either<Failure, Unit>> call(String email) =>
      _repository.sendPasswordResetEmail(email.trim());
}
