import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remote;
  final AuthLocalDataSource _local;
  final FirebaseAuth _firebaseAuth;

  const AuthRepositoryImpl({
    required AuthRemoteDataSource remote,
    required AuthLocalDataSource local,
    required FirebaseAuth firebaseAuth,
  })  : _remote = remote,
        _local = local,
        _firebaseAuth = firebaseAuth;

  // ── Helpers ──────────────────────────────────────────────────────────────

  Future<void> _persistToken() async {
    final token = await _firebaseAuth.currentUser?.getIdToken();
    if (token != null) await _local.saveToken(token);
  }

  Failure _mapException(Object e) {
    if (e is AuthException) {
      return Failure.server(message: e.message);
    } else if (e is NetworkException) {
      return Failure.network(message: e.message);
    } else {
      return const Failure.unexpected();
    }
  }

  // ── Login with email ──────────────────────────────────────────────────────

  @override
  Future<Either<Failure, AppUser>> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final model = await _remote.loginWithEmail(email: email, password: password);
      await _persistToken();
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  // ── Register ──────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, AppUser>> register({
    required String email,
    required String password,
    required String displayName,
    required UserRole role,
  }) async {
    try {
      final model = await _remote.register(
        email: email,
        password: password,
        displayName: displayName,
        role: role,
      );
      await _persistToken();
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  // ── Google Sign-In ────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, AppUser>> loginWithGoogle({UserRole? role}) async {
    try {
      final model = await _remote.loginWithGoogle(role: role);
      await _persistToken();
      return Right(model.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  // ── Logout ────────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _remote.logout();
      await _local.deleteToken();
      return const Right(unit);
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  // ── Get current user ──────────────────────────────────────────────────────

  @override
  Future<Either<Failure, AppUser?>> getCurrentUser() async {
    try {
      final model = await _remote.getCurrentUser();
      return Right(model?.toEntity());
    } catch (e) {
      return Left(_mapException(e));
    }
  }

  // ── Watch auth state ──────────────────────────────────────────────────────

  @override
  Stream<AppUser?> watchAuthState() =>
      _remote.watchAuthState().map((model) => model?.toEntity());
}
