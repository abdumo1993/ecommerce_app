import 'package:ecommerce_app/data/datasources/admin_user.dart';
import 'package:ecommerce_app/data/repositories/admin_user.dart';
import 'package:ecommerce_app/domain/entities/edit_user.dart';
import 'package:ecommerce_app/domain/usecases/admin_users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminUsersController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchUsers();
  }

  final queryParam = TextEditingController();
  final Users = Rx<List<GetUserModel>>([]);
  AdminUserUseCase useCase =
      AdminUserUseCase(repo: AdminUserImp(dataSource: AdminUserDataSource()));
  Future<List<GetUserModel>> fetchUsers() async {
    try {
      var res = await useCase.fetchUsers();
      Users(res);
      Users.refresh();
      return res;
    } catch (e) {
      print(e);
      return [];
    }
  }

  void changeList(String value) {
    var users = Users.value.where((element) {
      if (element.firstname?.contains(queryParam.text) ?? false) {
        return true;
      } else if (element.lastname?.contains(queryParam.text) ?? false) {
        return true;
      } else if (element.email?.contains(queryParam.text) ?? false) {
        return true;
      }
      return false;
    });
    Users(users.toList());
    Users.refresh();
  }
}
