import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Domain-layer failures.
/// Use [Either<Failure, T>] as return type in repositories and use-cases.
@freezed
sealed class Failure with _$Failure {
  /// Remote / API call failed.
  const factory Failure.server({
    required String message,
    int? statusCode,
  }) = ServerFailure;

  /// Local cache read/write failed.
  const factory Failure.cache({
    required String message,
  }) = CacheFailure;

  /// Device is offline.
  const factory Failure.network({
    @Default('No internet connection') String message,
  }) = NetworkFailure;

  /// Token expired or invalid credentials.
  const factory Failure.unauthorized({
    @Default('Unauthorized access') String message,
  }) = UnauthorizedFailure;

  /// Requested resource doesn't exist.
  const factory Failure.notFound({
    @Default('Resource not found') String message,
  }) = NotFoundFailure;

  /// Catch-all for unexpected failures.
  const factory Failure.unexpected({
    @Default('An unexpected error occurred') String message,
  }) = UnexpectedFailure;
}
