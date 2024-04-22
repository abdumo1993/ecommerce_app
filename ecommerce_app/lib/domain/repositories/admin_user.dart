import 'package:ecommerce_app/domain/entities/edit_user.dart';

abstract class IAdminUsers {
  Future<List<GetUserModel>> fetchUsers();
}
