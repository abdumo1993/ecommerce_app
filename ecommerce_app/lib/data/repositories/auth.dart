import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/data/datasources/auth.dart';
import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:ecommerce_app/domain/repositories/auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authProvider;

  AuthRepositoryImpl({required this.authProvider});
  @override
  Future<bool> login(LoginModel user) async {
    try {
      return await authProvider.login(user);
    } on AuthException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> logout() async => await authProvider.logout();

  @override
  Future<bool> refresh() {
    // TODO: implement refresh
    throw UnimplementedError();
  }

  @override
  Future<bool> register(RegisterModel user) async {
    try {
      return await authProvider.register(user);
    } catch (e) {
      rethrow;
    }
  }
}

class ReviewRepositoryImp implements ReviewRepository {
  final ReviewDataSource reviewSource;

  ReviewRepositoryImp({required this.reviewSource});

  @override
  Future<bool> send(ReviewModel review) async {
    return await reviewSource.send(review);
  }
}

class PDetailRepositoryImp implements PDetailRepository {
  final PDetailDataSource dataSource;

  PDetailRepositoryImp({required this.dataSource});
  @override
  Future<PDetailModel?> fetch(int id) async {
    return await dataSource.fetch(id);
  }
}
