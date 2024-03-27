import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/data/datasources/auth.dart';
import 'package:ecommerce_app/data/repositories/auth.dart';
import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/repositories/auth.dart';
import 'package:ecommerce_app/domain/usecases/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
DioClient dio = DioClient();
  final email = "".obs;
  final password = "".obs;
  RxnString emailError = RxnString(null);
  RxnString passwordError = RxnString(null);

  void validateEmail() {
    if (!GetUtils.isEmail(emailController.text)) {
      emailError.value = "Email is not valid";
    } else {
      emailError.value = null;
    }
  }

  void validatePassword() {
    if (passwordController.text.length < 6) {
      passwordError.value = "Password must be at least 6 characters";
    } else {
      passwordError.value = null;
    }
  }

  void submitForm() async {
    validateEmail();
    validatePassword();
    if (emailError.value == null && passwordError.value == null) {
     var use = LoginUserCase(repo: AuthRepositoryImpl(authProvider: AuthDataSource()));
     print("good here");
     var res = await use.call(LoginModel(email: emailController.text, password: passwordController.text));
     print("good here 2");

     print(res);

    }
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  updateEmail(String Email) {
    email(Email);
  }

  updatePassword(String Password) {
    password(Password);
  }
}

class RegisterConroller extends LoginController {
  final firstName = "".obs;
  final lastName = "".obs;
  final confirmPass = "".obs;

  RxnString firstNameError = RxnString(null);
  RxnString lastNameError = RxnString(null);
  RxnString confirmError = RxnString(null);

  void validateFirstName() {
    if (firstNameController.text.length < 6) {
      firstNameError.value = "firstname must be at least 6 characters";
    } else {
      firstNameError.value = null;
    }
  }

  void validateLastName() {
    if (lastNameController.text.length < 6) {
      lastNameError.value = "lastname must be at least 6 characters";
    } else {
      lastNameError.value = null;
    }
  }

  void validateConfirm() {
    if (confirmController.text != passwordController.text) {
      confirmError.value = "Cofirm Password and Password must be similar";
    } else {
      confirmError.value = null;
    }
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
}
