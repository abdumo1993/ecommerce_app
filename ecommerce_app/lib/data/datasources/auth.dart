// import 'dart:js_interop';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:get/get.dart';

class AuthDataSource {
  DioClient dio = DioClient();
  Future<bool> login(LoginModel user) async {
    try {
      var res = await dio.dio.post("/auth/login",
          data: {"email": user.email, "password": user.password});

      if (res.statusCode == 200) {
        // save access and refresh token to the storage
        // print("the data: ${res.data}");

        dio.saveTokens(res.data["access_token"]!, res.data["refresh_token"]);
        // print("the data: ${res.data}");
        return true;
      } else {
        throw LoginException();
      }
    } on LoginException catch (e) {
      print("lgoin Excepiton------------------------------------------");
      Get.toNamed("/error", arguments: {"message": e.toString()});
      // Future.delayed(Duration(seconds: 2), (){});
      throw LoginException();
    } on DioException catch (e) {
      print("Dio Excepiton---------------------------------------------");

      // Get.toNamed("/error", arguments: {
      //   "message": "Error Code:${e.response?.statusCode}. Try again."
      // });
      // Future.delayed(Duration(seconds: 2), (){});
throw Exception("connection error");
    }
    // return false;
  }

  Future<bool> register(RegisterModel user) async {
    try {
      var res = await dio.dio.post("/auth/register", data: {
        "email": user.email,
        "confirmPassword": user.confirmPassword,
        "firstname": user.firstname,
        "lastname": user.lastname,
        "password": user.password,
      });

      if (res.statusCode == 201) {
        print("register successful");
        // log in
        await login(LoginModel(email: user.email, password: user.password));

        return true;
      }
    } catch (e) {}
    return false;
  }

  Future<bool> refresh() async {
    try {} catch (e) {}
    return false;
  }

  Future<bool> logout() async {
    try {
      await dio.deleteTokens();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

class ReviewDataSource {
  DioClient dio = DioClient();

  Future<bool> send(ReviewModel review) async {
    try {
      var res = await dio.dio.post("/review", data: {
        "review": review.review,
        "rating": review.rating,
      });

      if (res.statusCode == 200) {
        return true;
      }
      else throw Exception("review failed");
    } catch (e) {
      Get.toNamed("/error", arguments: {"message" : e.toString()});
      return false;
    }
  
  }
}
