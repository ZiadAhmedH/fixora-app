import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/forgot_password_repository.dart';

class SendResetEmailUseCase {
  const SendResetEmailUseCase(this._repository);

  final ForgotPasswordRepository _repository;

  Future<Either<Failure, Unit>> call(String email) =>
      _repository.sendPasswordResetEmail(email);
}

