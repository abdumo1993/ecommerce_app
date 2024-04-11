import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/entities/product.dart';

abstract class AuthRepository {
  Future<bool> login(LoginModel user);
  Future<bool> register(RegisterModel user);
  Future<bool> refresh();
  Future<bool> logout();
}

abstract class ReviewRepository {
  Future<bool> send(ReviewModel review, int pid);
  Future<Map<String, dynamic>> fetch(int pid);
  Future<bool> delete(int pid);
}

abstract class PDetailRepository {
  Future<PDetailModel?> fetch(int id);
}
