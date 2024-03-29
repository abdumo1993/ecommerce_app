import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/data/datasources/auth.dart';
import 'package:ecommerce_app/data/repositories/auth.dart';
import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:ecommerce_app/domain/repositories/auth.dart';
import 'package:ecommerce_app/domain/usecases/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// to be moved to product controller file.
class PDetailController extends GetxController {
  final rating = RxnInt(null);
  TextEditingController reviewController = TextEditingController();
  RxBool valid = false.obs;
  void changeRating(value) {
    rating(value);
    print(rating);
  }

  void validateReview() {
    // print("${rating.value.toString()}, ${reviewController.text.toString()}");
    if (rating.value != null && reviewController.text.isNotEmpty) {
      print("indede");
      valid.value = true;
    }
    else {
      valid.value = false;
      };
  }

  void submitForm() async {
    validateReview();
    try {
      var use = ReviewUseCase(
          repo: ReviewRepositoryImp(reviewSource: ReviewDataSource()));
      var res = await use.send(
          ReviewModel(review: reviewController.text, rating: rating.value!));
      print(res);
      res == true ? Get.toNamed("/productDetail") : null;
      changeRating(0);
      reviewController.text = "";
    } catch (e) {
      Get.toNamed("/error", arguments: {"message": "login is needed"});
      Future.delayed(Duration(seconds: 3), () => Get.toNamed("/login"));
      // Get.toNamed("/login");
    }
    // submit the reviews using a use case.
  }
}

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
   try {if (emailError.value == null && passwordError.value == null) {
      var use = AuthUserCase(
          repo: AuthRepositoryImpl(authProvider: AuthDataSource()));
      print("good here");
      var res = await use.login(LoginModel(
          email: emailController.text, password: passwordController.text));
      print("good here 2");
      res == true ? Get.toNamed("/productDetail") : Get.toNamed("/login");
    }} on LoginException catch (e) {
      print("the problem is in auth controller ");
      Get.toNamed("/login", arguments: {"message": e.toString()});


    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});

    } on NetworkErrorException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
      Future.delayed(Duration(seconds: 2), () => Get.back());

    }
     catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
      Future.delayed(Duration(seconds: 2), () => Get.back());

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

  void submitForm() async {
    validateEmail();
    validatePassword();
    validateFirstName();
    validateLastName();
    validateConfirm();

    if (emailError.value == null &&
        passwordError.value == null &&
        firstNameError.value == null &&
        lastNameError.value == null &&
        confirmError.value == null) {
      var use = AuthUserCase(
          repo: AuthRepositoryImpl(authProvider: AuthDataSource()));
      print("good here");
      var res = await use.register(RegisterModel(
          email: emailController.text,
          password: passwordController.text,
          firstname: firstNameController.text,
          lastname: lastNameController.text,
          confirmPassword: confirmController.text));
      print("good here 2");

      print(res);
      res == true ? Get.toNamed("/productDetail") : Get.toNamed("/login");
    }
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
}

class LogoutController extends GetxController {
  Future<void> logout() async {
    var use =
        AuthUserCase(repo: AuthRepositoryImpl(authProvider: AuthDataSource()));
    bool a = await use.logout();
    a == true ? Get.toNamed("/login") : null;
  }
}
