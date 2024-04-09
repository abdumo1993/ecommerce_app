import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:ecommerce_app/domain/repositories/auth.dart';

class AuthUserCase {
  final AuthRepository repo;

  AuthUserCase({required this.repo});

  Future<bool> login(LoginModel user) async {
    try {
      return await repo.login(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> register(RegisterModel user) async {
    try {
      return await repo.register(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> logout() async {
    return await repo.logout();
  }
}

class ReviewUseCase {
  final ReviewRepository repo;

  ReviewUseCase({required this.repo});
  Future<bool> send(ReviewModel review) async {
    try {
      return await repo.send(review);
    } catch (e) {
      rethrow;
    }
  }
}

class PDetailUseCase {
  final PDetailRepository repo;

  PDetailUseCase({required this.repo});

  Future<PDetailModel?> fetch(int id) async {
    try {
      return await repo.fetch(id);
    } catch (e) {
      rethrow;
    }
  }
}
