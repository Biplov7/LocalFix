sealed class AppException implements Exception {
  const AppException(this.message, [this.cause]);
  final String message;
  final Object? cause;

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}

class ServerException extends AppException {
  const ServerException([super.message = "Server error", super.cause]);
}

class NetworkException extends AppException {
  const NetworkException([super.message = "Netwrok unavailable", super.cause]);
}

class CacheException extends AppException {
  const CacheException([
    super.message = 'Cache read/write failed',
    super.cause,
  ]);
}

class AuthException extends AppException {
  const AuthException([super.message = 'Authentication error', super.cause]);
}

class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Resource not found', super.cause]);
}

class LocationException extends AppException{
  const LocationException([super.message = 'Location denied', super.cause]);
}