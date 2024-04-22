import 'package:ecommerce_app/data/datasources/admin_user.dart';
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
}
