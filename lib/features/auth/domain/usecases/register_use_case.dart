import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _repository;
  const RegisterUseCase(this._repository);

  Future<Either<Failure, AppUser>> call({
    required String email,
    required String password,
    required String displayName,
    required UserRole role,
  }) =>
      _repository.register(
        email: email,
        password: password,
        displayName: displayName,
        role: role,
      );
}
