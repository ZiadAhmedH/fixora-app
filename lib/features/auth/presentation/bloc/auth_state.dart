import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/app_user.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  /// Initial state — auth status unknown (before startup check).
  const factory AuthState.initial() = _Initial;

  /// Email / password sign-in is in progress.
  const factory AuthState.loadingEmail() = _LoadingEmail;

  /// Google sign-in is in progress.
  const factory AuthState.loadingGoogle() = _LoadingGoogle;

  /// Generic loading (startup check, logout, register, etc.).
  const factory AuthState.loading() = _Loading;

  /// User is authenticated.
  const factory AuthState.authenticated({required AppUser user}) =
      _Authenticated;

  /// User is not authenticated.
  const factory AuthState.unauthenticated() = _Unauthenticated;

  /// Registration completed successfully — user should go to login.
  const factory AuthState.registerSuccess() = _RegisterSuccess;

  /// An auth operation failed.
  const factory AuthState.failure({required String message}) = _Failure;
}
