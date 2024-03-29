

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
