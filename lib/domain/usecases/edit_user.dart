import 'package:ecommerce_app/domain/entities/edit_user.dart';
import 'package:ecommerce_app/domain/repositories/edit_user.dart';

class EditUserCase{
  final EditUserRepository repo;

  EditUserCase({required this.repo});
  
  Future<bool> editUser(EditUserModel user) async {
    try {
      return await repo.editUser(user);
    } catch (e) {
      rethrow;
    }
  }
}

class GetUserCase{
  final GetUserRepository repo;

  GetUserCase({required this.repo});
  
  Future<GetUserModel?> getUserDetails() async {
    try {
      return await repo.getUserDetails();
    } catch (e) {
      rethrow;
    }
  }
}