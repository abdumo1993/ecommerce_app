import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/data/data_sources/edit_user.dart';
import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/data/datasources/auth.dart';
import 'package:ecommerce_app/data/repositories/auth.dart';
import 'package:ecommerce_app/data/repositories/edit_user.dart';
import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/entities/edit_user.dart';
import 'package:ecommerce_app/domain/usecases/auth.dart';
import 'package:ecommerce_app/domain/usecases/edit_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUserController extends GetxController {

  DioClient dio = DioClient();
  final firstName = "".obs;
  final lastName = "".obs;
  final email = "".obs;
  final password = "".obs;
  final confirmPass = "".obs;

  var editList = [true,false,false,false].obs;
  var obscure = true.obs;
  
   void changeObscure(){
  obscure.value = !obscure.value;
  }
  void chanageEdit(int index){
    editList[index] = editList[index];
  }
  bool getEdit(int index){
    return editList[index];
  }

  RxnString firstNameError = RxnString(null);
  RxnString lastNameError = RxnString(null);
  RxnString emailError = RxnString(null);
  RxnString passwordError = RxnString(null);
  RxnString confirmError = RxnString(null);


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmController = TextEditingController();


  void validateFirstName() {
    if (firstNameController.text.length < 6 && firstNameController.text.isNotEmpty) {
      firstNameError.value = "firstname must be at least 6 characters";
    }else if(!firstNameController.text.isAlphabetOnly && firstNameController.text.isNotEmpty){
      firstNameError.value = "firstname must be letters only";
    } else {
      firstNameError.value = null;
    }
  }

  void validateLastName() {
    if (lastNameController.text.length < 6 && lastNameController.text.isNotEmpty) {
      lastNameError.value = "lastname must be at least 6 characters";
    }else if(!lastNameController.text.isAlphabetOnly && lastNameController.text.isNotEmpty){
      lastNameError.value = "lastname must be letters only";
    } else {
      lastNameError.value = null;
    }
  }

  void validateEmail() {
    if (!GetUtils.isEmail(emailController.text) && emailController.text.isNotEmpty) {
      emailError.value = "Email is not valid";
    } else {
      emailError.value = null;
    }
  }

  void validatePassword() {
    if (passwordController.text.length < 6  && passwordController.text.isNotEmpty) {
      passwordError.value = "Password must be at least 6 characters";
    } else {
      passwordError.value = null;
    }
  }

  void validateConfirm() {
    if (confirmController.text == passwordController.text && confirmController.text.isNotEmpty) {
      confirmError.value = "Old Password and New Password are the same";
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
    var editedUser = EditUserModel(
        email: emailController.text,
        password: passwordController.text,
        firstname: firstNameController.text,
        lastname: lastNameController.text,
        confirmPassword: confirmController.text);
    if (editedUser.toJson().toString() == {}.toString()) {
      //something happens
      Get.snackbar("Nothing to change","Please enter the field you want to edit",
                backgroundColor: ThemeData.dark().colorScheme.secondary,
                colorText: ThemeData.dark().colorScheme.onPrimary);
    } else {
      try {
        var use = EditUserCase(
            repo:
                EditUserRepositoryImpl(editUserProvider: EditUserDataSource()));
        var res = await use.editUser(editedUser);
        res == true
            ? (
                Get.snackbar(
                    "Update details", "User details updated successfully",
                    backgroundColor: ThemeData.dark().colorScheme.secondary,
                    colorText: ThemeData.dark().colorScheme.onPrimary),
              )
            : Get.snackbar("Update details",
                "Failed to update user details. Please try again",
                backgroundColor: ThemeData.dark().colorScheme.secondary,
                colorText: ThemeData.dark().colorScheme.onPrimary);
      } on AuthException catch (e) {
        // redendant with badresopnseexcepitonoi to be removed after verification.
        Get.snackbar("invalid tokens", "please login to your account",
            backgroundColor: ThemeData.dark().colorScheme.secondary,
            colorText: ThemeData.dark().colorScheme.onPrimary);
      } on NetworkException catch (e) {
        Get.snackbar(
            "Network Error", "Please check your connection and try again",
            backgroundColor: ThemeData.dark().colorScheme.secondary,
            colorText: ThemeData.dark().colorScheme.onPrimary);
      } on BadResponseException catch (e) {
        if (e.statusCode == 500) {
          Get.snackbar("Server is busy",
              "Having trouble seving your requests, due to too many requests. Please try again later",
              backgroundColor: ThemeData.dark().colorScheme.secondary,
              colorText: ThemeData.dark().colorScheme.onPrimary);
        } else {
          Get.snackbar("Server is busy",
              "Having trouble seving your requests, due to too many requests. Please try again later",
              backgroundColor: ThemeData.dark().colorScheme.secondary,
              colorText: ThemeData.dark().colorScheme.onPrimary);
        }
      }
    }
    // on CustomeException catch (e) {
    //   Get.toNamed("/error", arguments: {"message": e.toString()});
    // } catch (e) {
    //   print(e.runtimeType);
    //   Get.toNamed("/error", arguments: {"message": "Something went wrong r"});
    // }
  }
}
