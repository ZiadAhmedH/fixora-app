import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_event.freezed.dart';

@freezed
sealed class SplashEvent with _$SplashEvent {
  /// Triggered once the splash animation finishes.
  const factory SplashEvent.started() = _Started;
}
