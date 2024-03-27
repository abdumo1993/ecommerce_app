import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/repositories/auth.dart';

class LoginUserCase {
  final AuthRepository repo;

  LoginUserCase({required this.repo});

  Future<String> call(LoginModel user) async {
    return await repo.login(user);
  }
  
}