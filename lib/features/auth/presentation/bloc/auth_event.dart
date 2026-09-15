import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/app_user.dart';

part 'auth_event.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  /// Check persisted auth state on app startup.
  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatus;

  /// Email + password login.
  const factory AuthEvent.loginWithEmail({
    required String email,
    required String password,
  }) = _LoginWithEmail;

  /// Google Sign-In. [role] required on first sign-in.
  const factory AuthEvent.loginWithGoogle({UserRole? role}) = _LoginWithGoogle;

  /// Register a new account.
  const factory AuthEvent.register({
    required String email,
    required String password,
    required String displayName,
    required UserRole role,
  }) = _Register;

  /// Sign out.
  const factory AuthEvent.logout() = _Logout;
}
