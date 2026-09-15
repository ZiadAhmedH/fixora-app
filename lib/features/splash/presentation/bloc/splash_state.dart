import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
sealed class SplashState with _$SplashState {
  /// Initial — animation still running.
  const factory SplashState.initial() = _Initial;

  /// Auth check completed — user is authenticated.
  const factory SplashState.authenticated() = _Authenticated;

  /// Auth check completed — no active session.
  const factory SplashState.unauthenticated() = _Unauthenticated;
}
