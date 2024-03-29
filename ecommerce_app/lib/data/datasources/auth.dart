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
      }
      else if (res.statusCode == 401) {
        throw LoginException(message: res.data.toString());
      } else {
        throw LoginException(message: "something went wrong. try again later.");
      }
    } on LoginException catch (e) {
      print("login exception: $e");
      rethrow;
      // Future.delayed(Duration(seconds: 2), (){});
    } on DioException catch (e) {
       
    if (e.type == DioExceptionType.connectionError || e.type == DioExceptionType.connectionTimeout){
      throw NetworkErrorException(message: "Connection Error. please try again later");
    }
    if (e.type == DioExceptionType.unknown) {
      throw CustomeException(message: "Something went wrong. try again later");
    }
    else {
      throw CustomeException(message: "somethin went wrong.");

    }

    }  catch (e) {
      throw CustomeException(message: "something went wrong.");
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
