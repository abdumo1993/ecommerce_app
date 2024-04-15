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
  Future<bool> send(ReviewModel review, int pid) async {
    try {
      return await reviewSource.send(review, pid);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> fetch(int pid) async {
    try {
      return await reviewSource.fetch(pid);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> delete(int pid) async {
    try {
      return await reviewSource.delete(pid);
    } catch (e) {
      rethrow;
    }
  }
}

class PDetailRepositoryImp implements PDetailRepository {
  final PDetailDataSource dataSource;

  PDetailRepositoryImp({required this.dataSource});
  @override
  Future<PDetailModel?> fetch(int id) async {
    try {
      return await dataSource.fetch(id);
    } catch (e) {
      rethrow;
    }
  }
}
