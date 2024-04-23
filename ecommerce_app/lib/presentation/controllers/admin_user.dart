import 'package:ecommerce_app/data/datasources/admin_user.dart';
import 'package:ecommerce_app/data/repositories/admin_user.dart';
import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/entities/edit_user.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';

import 'package:ecommerce_app/domain/usecases/admin_users.dart';
import 'package:ecommerce_app/presentation/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminUsersController extends RegisterConroller {
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
  final rowsPerPage = 10.obs;
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
    } on BadResponseException catch (e) {
      if (e.statusCode == 404) {
        Get.toNamed("/emptyCart");
      } else if (e.statusCode == 400) {
        Get.snackbar("Invalid", "invalid request.");
      } else if (e.statusCode == 500) {
        Get.toNamed("/error", arguments: {
          "message": "A Server Error has occured. try again later."
        });
      }
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } catch (e) {
      Get.toNamed("/error",
          arguments: {"message": "something went wrong. try again later"});
    }
    return [];
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

  void deleteUser(String id, String email) async {
    try {
      var res = await useCase.deleteUser(id, email);
      if (res) {
        await fetchUsers();
        Users.refresh();
      }
    } on BadResponseException catch (e) {
      if (e.statusCode == 404) {
        Get.toNamed("/emptyCart");
      } else if (e.statusCode == 400) {
        Get.snackbar("Invalid", "invalid request.");
      } else if (e.statusCode == 500) {
        Get.toNamed("/error", arguments: {
          "message": "A Server Error has occured. try again later."
        });
      }
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } catch (e) {
      Get.toNamed("/error",
          arguments: {"message": "something went wrong. try again later"});
    }
  }

  @override
  void submitForm() async {
    print("ere?");
    validateEmail();
    validatePassword();
    validateFirstName();
    validateLastName();
    validateConfirm();

    try {
      if (emailError.value == null &&
          passwordError.value == null &&
          firstNameError.value == null &&
          lastNameError.value == null &&
          confirmError.value == null) {
        var use = AdminUserUseCase(
            repo: AdminUserImp(dataSource: AdminUserDataSource()));
        var res = await use.register(RegisterModel(
            email: emailController.text,
            password: passwordController.text,
            firstname: firstNameController.text,
            lastname: lastNameController.text,
            confirmPassword: confirmController.text));
        if (res == true) {
          (
            Get.toNamed("/confirm"),
            Future.delayed(Duration(seconds: 2), () => Get.back())
          );
          await fetchUsers();
        }
        ;

        emailController.text = '';
        passwordController.text = '';
        firstNameController.text = '';
        lastNameController.text = '';
        confirmController.text = '';
      }
    } on AuthException catch (e) {
      // redendant with badresopnseexcepitonoi to be removed after verification.
      Get.offAllNamed("/register", arguments: {"message": e.toString()});
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } on BadResponseException catch (e) {
      if (e.statusCode == 500) {
        Get.toNamed("/error", arguments: {"message": e.toString()});
      } else {
        Get.offAllNamed("/register", arguments: {"message": e.message});
      }
    } catch (e) {
      Get.toNamed("/error", arguments: {"message": "Something went wrong r"});
    }
  }
}
