import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/entities/edit_user.dart';

abstract class IAdminUsers {
  Future<List<GetUserModel>> fetchUsers();
  Future<bool> deleteUser(String id, String email);
  Future<bool> register(RegisterModel user);

}
