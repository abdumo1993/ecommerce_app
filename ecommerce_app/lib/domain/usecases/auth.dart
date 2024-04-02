import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:ecommerce_app/domain/repositories/auth.dart';

class AuthUserCase {
  final AuthRepository repo;

  AuthUserCase({required this.repo});

  Future<bool> login(LoginModel user) async {
    return await repo.login(user);
  }

  Future<bool> register(RegisterModel user) async {
    return await repo.register(user);

  }
  Future<bool> logout() async {
    return await repo.logout();
  }
}


class ReviewUseCase {
  final ReviewRepository repo;

  ReviewUseCase({required this.repo});
Future<bool> send(ReviewModel review) async {
  
  return await repo.send(review);
}

}

class PDetailUseCase {
  final PDetailRepository repo;

  PDetailUseCase({required this.repo});

  Future<PDetailModel?> fetch (String id) async {
    return await repo.fetch(id);
  }
  
}
