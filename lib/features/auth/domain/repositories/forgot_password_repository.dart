import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

/// Contract for the forgot-password feature.
abstract interface class ForgotPasswordRepository {
  /// Sends a Firebase password-reset email to [email].
  Future<Either<Failure, Unit>> sendPasswordResetEmail(String email);
}

