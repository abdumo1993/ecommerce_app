import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/entities/edit_user.dart';
import 'package:ecommerce_app/domain/repositories/admin_user.dart';

class AdminUserUseCase {
  final IAdminUsers repo;

  AdminUserUseCase({required this.repo});

  Future<List<GetUserModel>> fetchUsers() async {
    try {
      return await repo.fetchUsers();
    } catch (e) {
      rethrow;
    }
  }

   Future<bool> deleteUser(String id, String email) async {
    try {
      return await repo.deleteUser(id, email);
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

}
