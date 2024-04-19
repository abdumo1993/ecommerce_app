import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:ecommerce_app/domain/repositories/auth.dart';

class AuthUserCase {
  final AuthRepository repo;

  AuthUserCase({required this.repo});

  Future<bool> login(LoginModel user) async {
    try {
      var data = await repo.login(user);
      return data;
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

  Future<bool> forgotPasswordEmail(String email) async {
    try {
      return await repo.forgotPasswordEmail(email);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> forgotPasswordNew(Map<String, String> json) async {
    try {
      return await repo.forgotPasswordNew(json);
    } catch (e) {
      rethrow;
    }
  }
}

class ReviewUseCase {
  final ReviewRepository repo;

  ReviewUseCase({required this.repo});
  Future<bool> send(ReviewModel review, int pid) async {
    try {
      return await repo.send(review, pid);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetch(int pid) async {
    try {
      return await repo.fetch(pid);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> delete(int pid) async {
    try {
      return await repo.delete(pid);
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
