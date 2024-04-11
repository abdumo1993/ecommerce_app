import 'package:ecommerce_app/domain/entities/edit_user.dart';

abstract class EditUserRepository {
  Future<bool> editUser(EditUserModel user);
}