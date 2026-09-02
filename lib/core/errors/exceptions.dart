/// Thrown when a server / remote call fails.
class ServerException implements Exception {
  final String message;
  final int? statusCode;
  const ServerException({required this.message, this.statusCode});

  @override
  String toString() => 'ServerException($statusCode): $message';
}

/// Thrown when a local cache operation fails.
class CacheException implements Exception {
  final String message;
  const CacheException({required this.message});

  @override
  String toString() => 'CacheException: $message';
}

/// Thrown when network is unavailable.
class NetworkException implements Exception {
  final String message;
  const NetworkException({this.message = 'No internet connection'});

  @override
  String toString() => 'NetworkException: $message';
}

/// Thrown when authentication fails or token expires.
class UnauthorizedException implements Exception {
  final String message;
  const UnauthorizedException({this.message = 'Unauthorized'});

  @override
  String toString() => 'UnauthorizedException: $message';
}

/// Thrown when a Firebase Auth operation fails.
/// Maps Firebase error codes to user-friendly messages.
class AuthException implements Exception {
  final String message;
  final String? code;

  const AuthException({required this.message, this.code});

  factory AuthException.fromFirebaseCode(String code) {
    final message = switch (code) {
      'user-not-found' => 'No account found with this email.',
      'wrong-password' => 'Incorrect password. Please try again.',
      'invalid-credential' => 'Invalid credentials. Please try again.',
      'email-already-in-use' => 'An account already exists with this email.',
      'weak-password' => 'Password is too weak. Use at least 6 characters.',
      'invalid-email' => 'Please enter a valid email address.',
      'user-disabled' => 'This account has been disabled. Contact support.',
      'too-many-requests' => 'Too many attempts. Please try again later.',
      'operation-not-allowed' => 'This sign-in method is not enabled.',
      'account-exists-with-different-credential' =>
        'An account already exists with a different sign-in method.',
      'network-request-failed' => 'Network error. Please check your connection.',
      _ => 'Authentication failed. Please try again.',
    };
    return AuthException(message: message, code: code);
  }

  @override
  String toString() => 'AuthException($code): $message';
}
