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
}
