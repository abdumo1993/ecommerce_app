import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/repositories/auth.dart';

class AuthUserCase {
  final AuthRepository repo;

  AuthUserCase({required this.repo});

  Future<String> login(LoginModel user) async {
    return await repo.login(user);
  }

  Future<String> register(RegisterModel user) async {
    return await repo.register(user);

  }
  Future<void> logout() async {
    return await repo.logout();
  }
}

