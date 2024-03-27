import 'package:ecommerce_app/domain/entities/auth.dart';

abstract class AuthRepository {
  Future<String> login(LoginModel user);
  Future<String> register(RegisterModel user);
  Future<String> refresh();
  Future<void> logout();
}