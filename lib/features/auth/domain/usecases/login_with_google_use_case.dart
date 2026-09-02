import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/app_user.dart';
import '../repositories/auth_repository.dart';

class LoginWithGoogleUseCase {
  final AuthRepository _repository;
  const LoginWithGoogleUseCase(this._repository);

  Future<Either<Failure, AppUser>> call({UserRole? role}) =>
      _repository.loginWithGoogle(role: role);
}
