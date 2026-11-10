import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repositories/forgot_password_repository.dart';

final class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  const ForgotPasswordRepositoryImpl(this._auth);

  final FirebaseAuth _auth;

  @override
  Future<Either<Failure, Unit>> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      final authEx = AuthException.fromFirebaseCode(e.code);
      return Left(Failure.server(message: authEx.message));
    } catch (_) {
      return const Left(
        Failure.unexpected(message: 'Unexpected error sending reset email.'),
      );
    }
  }
}
