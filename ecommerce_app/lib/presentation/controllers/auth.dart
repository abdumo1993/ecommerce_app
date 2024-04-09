import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/data/datasources/auth.dart';
import 'package:ecommerce_app/data/repositories/auth.dart';
import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:ecommerce_app/domain/repositories/auth.dart';
import 'package:ecommerce_app/domain/usecases/auth.dart';
import 'package:ecommerce_app/presentation/pages/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// to be moved to product controller file.
class PDetailController extends GetxController {
  final rating = RxnInt(null);
  TextEditingController reviewController = TextEditingController();
  RxBool valid = false.obs;
  void changeRating(value) {
    rating(value);
  }

  void validateReview() {
    if (rating.value != null && reviewController.text.isNotEmpty) {
      valid.value = true;
    } else {
      valid.value = false;
    }
    ;
  }

  void submitForm() async {
    validateReview();
    if (valid.value == true) {
      try {
        var use = ReviewUseCase(
            repo: ReviewRepositoryImp(reviewSource: ReviewDataSource()));
        var res = await use.send(
            ReviewModel(review: reviewController.text, rating: rating.value!));
        res == true ? Get.toNamed("/productDetail") : null;
        changeRating(0);
        reviewController.text = "";
      } on BadResponseException catch (e) {
        if (e.statusCode == 500) {
          Get.toNamed("/error", arguments: {
            "message":
                "An error has Occured on the server side. please try later."
          });
        } else if (e.statusCode == 400) {
          Get.toNamed("/error",
              arguments: {"message": "Invalid Request Format."});
        } else {
          Get.toNamed("/error",
              arguments: {"message": "Something went wrong p"});
        }
      } catch (e) {
        Get.toNamed("/error", arguments: {"message": "login is needed"});
        Future.delayed(const Duration(seconds: 2), () => Get.toNamed("/login"));
        // Get.toNamed("/login");
      }
    }
    // submit the reviews using a use case.
  }

  Future<PDetailModel?> retrieveProduct(int id) async {
    try {
      var use = PDetailUseCase(
          repo: PDetailRepositoryImp(dataSource: PDetailDataSource()));
      var a = await use.fetch(id);
      return a;
    } on BadResponseException catch (e) {
      print(e.statusCode);
      if (e.statusCode == 500) {
        Get.offNamed("/error", arguments: {
          "message":
              "An Error has occured on the server side. please try again later."
        });
      } else if (e.statusCode == 404) {
        Get.offNamed("/home");
        Get.snackbar("NotFound", "Product is not found.");
      }
    }
    return null;
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
    try {
      if (emailError.value == null && passwordError.value == null) {
        var use = AuthUserCase(
            repo: AuthRepositoryImpl(authProvider: AuthDataSource()));
        var res = await use.login(LoginModel(
            email: emailController.text, password: passwordController.text));
        res == true ? Get.toNamed("/home") : null;
      }
    } on AuthException catch (e) {
      // redendant with badresopnseexcepitonoi to be removed after verification.
      Get.offAllNamed("/login", arguments: {"message": e.toString()});
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } on BadResponseException catch (e) {
      if (e.statusCode == 500) {
        Get.toNamed("/error", arguments: {"message": e.toString()});
      } else {
        Get.offAllNamed("/login", arguments: {"message": e.message});
      }
    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } catch (e) {
      Get.toNamed("/error", arguments: {"message": "Something went wrong l"});
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

    try {
      print("203");

      if (emailError.value == null &&
          passwordError.value == null &&
          firstNameError.value == null &&
          lastNameError.value == null &&
          confirmError.value == null) {
        var use = AuthUserCase(
            repo: AuthRepositoryImpl(authProvider: AuthDataSource()));
        var res = await use.register(RegisterModel(
            email: emailController.text,
            password: passwordController.text,
            firstname: firstNameController.text,
            lastname: lastNameController.text,
            confirmPassword: confirmController.text));
        res == true ? Get.toNamed("/home") : Get.toNamed("/login");
      }
    } on AuthException catch (e) {
      // redendant with badresopnseexcepitonoi to be removed after verification.
      Get.offAllNamed("/register", arguments: {"message": e.toString()});
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } on BadResponseException catch (e) {
      print("how sie jfljalf");
      if (e.statusCode == 500) {
        Get.toNamed("/error", arguments: {"message": e.toString()});
      } else {
        Get.offAllNamed("/register", arguments: {"message": e.message});
      }
    } on CustomeException catch (e) {
      print("here is hte erroer");
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } catch (e) {
      print(e);
      Get.toNamed("/error", arguments: {"message": "Something went wrong r"});
    }
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
}

class LogoutController extends GetxController {
  Future<void> logout() async {
    try {
      var use = AuthUserCase(
          repo: AuthRepositoryImpl(authProvider: AuthDataSource()));
      bool a = await use.logout();
      a == true ? Get.offAllNamed("/login") : null;
    } catch (e) {
      Get.snackbar("Logout Failed.", "log out failed. try again.");
    }
  }
}
