import '../../../auth/domain/entities/app_user.dart';
import '../../../auth/domain/repositories/auth_repository.dart';

/// Determines the initial auth state on app startup.
class CheckAuthStatusUseCase {
  final AuthRepository _repository;
  const CheckAuthStatusUseCase(this._repository);

  Future<AppUser?> call() async {
    final result = await _repository.getCurrentUser();
    return result.fold((_) => null, (user) => user);
  }
}
