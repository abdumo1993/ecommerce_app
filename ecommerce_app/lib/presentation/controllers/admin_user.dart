import 'package:ecommerce_app/data/datasources/admin_user.dart';
import 'package:ecommerce_app/data/repositories/admin_user.dart';
import 'package:ecommerce_app/domain/entities/edit_user.dart';
import 'package:ecommerce_app/domain/usecases/admin_users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminUsersController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await fetchUsers();
  }

  final queryParam = TextEditingController();
  final Users = Rx<List<GetUserModel>>([]);
  final filterUsers = Rx<List<GetUserModel>>([]);
  final currentPage = 0.obs;
  final rowsPerPage = 2.obs;
  final currentPageUsers = Rx<List<GetUserModel>>([]);
  AdminUserUseCase useCase =
      AdminUserUseCase(repo: AdminUserImp(dataSource: AdminUserDataSource()));
  Future<List<GetUserModel>> fetchUsers() async {
    try {
      var res = await useCase.fetchUsers();
      Users(res);
      filterUsers(res);
      filterUsers.refresh();
      changePage(0);
      Users.refresh();
      return Users.value;
    } catch (e) {
      print(e);
      return [];
    }
  }

  void changePage(int pageNumber) {
    currentPage(pageNumber);
    filterUsers(Users.value
        .skip(currentPage.value * rowsPerPage.value)
        .take(rowsPerPage.value)
        .toList());
    filterUsers.refresh();
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
    filterUsers(users.toList());
    filterUsers.refresh();
  }
}
