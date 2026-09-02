import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/app_user.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  /// Initial state — auth status unknown (before startup check).
  const factory AuthState.initial() = _Initial;

  /// Any auth operation is in progress.
  const factory AuthState.loading() = _Loading;

  /// User is authenticated.
  const factory AuthState.authenticated({required AppUser user}) =
      _Authenticated;

  /// User is not authenticated.
  const factory AuthState.unauthenticated() = _Unauthenticated;

  /// An auth operation failed.
  const factory AuthState.failure({required String message}) = _Failure;
}
