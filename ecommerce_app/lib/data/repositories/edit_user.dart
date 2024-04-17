import 'package:ecommerce_app/data/data_sources/edit_user.dart';
import 'package:ecommerce_app/domain/entities/edit_user.dart';
import 'package:ecommerce_app/domain/repositories/edit_user.dart';

class EditUserRepositoryImpl implements EditUserRepository{
  final EditUserDataSource editUserProvider;

  EditUserRepositoryImpl({required this.editUserProvider});
  
  @override
  Future<bool> editUser(EditUserModel user) async {
    try {
      return await editUserProvider.editUser(user);
    } catch (e) {
      rethrow;
    }
  }
}