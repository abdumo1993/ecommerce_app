import 'package:dio/dio.dart';

class LoginException implements Exception {
  final String message;

  LoginException({required this.message});


  @override
  String toString() => message;
}



class RefreshTokenNotFoundExeption implements Exception {
  static const message = "Credentials Not found, try Again";

  @override
  String toString() => '$message';
}

class RefreshFailedException implements Exception {
  static const message = "Credentials Not found, try Again";

  @override
  String toString() => '$message';
}

class AccessTokenNotFoundExeption implements Exception {
  static const message = "Credentials Not found, try Again";

  @override
  String toString() => '$message';
}


// the new ones

// refresh token expired
// invalid refresh token
// network error
// access denied
// access token expired
// general error
// unknown dio error

class LogoutFailedException implements Exception {
  final String message;
  LogoutFailedException({required this.message});

  @override 
  String toString() => message;
}
class RExpiredException implements Exception {
  final String message;

  RExpiredException({required this.message});

  @override
  String toString() => message;
}

class RInvalidError implements Exception {
  final String message;

  RInvalidError({required this.message});

  @override
  String toString() => message;
}

class NetworkErrorException implements Exception {
  final String message;

  NetworkErrorException({required this.message});

  @override
  String toString() => message;
}

class AccessDeniedException implements Exception {
  final String message;
  AccessDeniedException({required this.message});

  @override 
  String toString() => message;
}

class CustomeException implements Exception {
  final String message;

  CustomeException({required this.message});

  @override 
  String toString() => message;
  
}
