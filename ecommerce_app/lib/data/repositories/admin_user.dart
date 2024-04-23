import 'package:ecommerce_app/data/datasources/admin_user.dart';
import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/entities/edit_user.dart';
import 'package:ecommerce_app/domain/repositories/admin_user.dart';

class AdminUserImp implements IAdminUsers {
  final AdminUserDataSource dataSource;

  AdminUserImp({required this.dataSource});
  @override
  Future<List<GetUserModel>> fetchUsers() async {
    try {
      return await dataSource.fetchUsers();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteUser(String id, String email) async {
    try {
      return await dataSource.deleteUser(id, email);
    } catch (e) {
      rethrow;
    }
    
  }

  
  @override
  Future<bool> register(RegisterModel user) async {
    try {
      return await dataSource.register(user);
    } catch (e) {
      rethrow;
    }
  }
}
