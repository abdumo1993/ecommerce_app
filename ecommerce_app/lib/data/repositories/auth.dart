import 'package:ecommerce_app/data/datasources/auth.dart';
import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/repositories/auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authProvider;

  AuthRepositoryImpl({required this.authProvider});
  @override
  Future<String> login(LoginModel user) => authProvider.login(user);

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<String> refresh() {
    // TODO: implement refresh
    throw UnimplementedError();
  }

  @override
  Future<String> register(RegisterModel user) {
    // TODO: implement register
    throw UnimplementedError();
  }
  
}