import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/app_user.dart';

/// Abstract contract for all authentication operations.
/// Implementations live in the data layer.
abstract interface class AuthRepository {
  /// Sign in with email and password.
  Future<Either<Failure, AppUser>> loginWithEmail({
    required String email,
    required String password,
  });

  /// Register a new user with email, password, name, and role.
  Future<Either<Failure, AppUser>> register({
    required String email,
    required String password,
    required String displayName,
    required UserRole role,
  });

  /// Sign in with a Google account.
  /// On first sign-in, [role] must be provided to create the user profile.
  Future<Either<Failure, AppUser>> loginWithGoogle({UserRole? role});

  /// Sign out the current user.
  Future<Either<Failure, Unit>> logout();

  /// Returns the currently authenticated user, or null if unauthenticated.
  Future<Either<Failure, AppUser?>> getCurrentUser();

  /// Stream that emits [AppUser] when authenticated or [null] when signed out.
  Stream<AppUser?> watchAuthState();
}
