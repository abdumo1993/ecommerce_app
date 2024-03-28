class LoginException implements Exception {
  static const message = "failed to login.";

  @override
  String toString() => '${runtimeType.toString()}: $message';
}

class RegisterException implements Exception {
  static const message = "Failed to Register.";

  @override
  String toString() => '${runtimeType.toString()}: $message';
}

class RefreshTokenNotFoundExeption implements Exception {
  static const message = "Credentials Not found, try Again";

  @override
  String toString() => '${runtimeType.toString()}: $message';
}

class RefreshFailedException implements Exception {
  static const message = "Credentials Not found, try Again";

  @override
  String toString() => '${runtimeType.toString()}: $message';
}

class AccessTokenNotFoundExeption implements Exception {
  static const message = "Credentials Not found, try Again";

  @override
  String toString() => '${runtimeType.toString()}: $message';
}


class TokenNotFoundException implements Exception {
  static const message = "Tokens not found";

  @override
  String toString() => "${runtimeType.toString()}: $message";
}

class SavingFailedException implements Exception {
  static const message = "saving tokens failed";

  @override
  String toString() => "${runtimeType.toString()}: $message";
}