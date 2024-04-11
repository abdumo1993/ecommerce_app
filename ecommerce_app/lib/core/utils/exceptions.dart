class CustomeException implements Exception {
  final String message;

  CustomeException({required this.message});

  @override
  String toString() => message;
}

class AuthException implements Exception {
  final String message;

  AuthException({required this.message});

  @override
  String toString() => message;
}

class NetworkException implements Exception {
  final String message;

  NetworkException({required this.message});

  @override
  String toString() => message;
}

class BadResponseException implements Exception {
  final String message;
  final dynamic statusCode;
  final String? path;

  BadResponseException(
      {required this.message, this.statusCode = 400, this.path});
  @override
  String toString() => "lksjfkajfklj$statusCode: $message";
}
