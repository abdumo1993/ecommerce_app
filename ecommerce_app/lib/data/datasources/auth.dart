// import 'dart:js_interop';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/core/utils/handleExceptions.dart';
import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:get/get.dart';

class AuthDataSource {
  DioClient dio = DioClient();
  Future<bool> login(LoginModel user) async {
    try {
      var res = await dio.dio.post("/auth/login",
          data: user.toJson());

      if (res.statusCode == 200) {
        // save access and refresh token to the storage

        dio.saveTokens(res.data["accessToken"], res.data["refreshToken"]);
        return true;
      } else if (res.statusCode == 401) {
        throw AuthException(message: res.data.toString());
      } else {
        throw CustomeException(
            message: "something went wrong. try again later.");
      }
    } on AuthException catch (e) {
      rethrow;
      // Future.delayed(Duration(seconds: 2), (){});
    } on DioException catch (e) {
      handleDioException(e);
    } on CustomeException catch (e) {
      rethrow;
    } catch (e) {
      throw CustomeException(message: "something went wrong");
    }
    return false;
    // return false;
  }

  Future<bool> register(RegisterModel user) async {
    try {
      var res = await dio.dio.post("/auth/register", data: user.toJson());


      if (res.statusCode == 200) {
        // log in
        return await login(
            LoginModel(email: user.email, password: user.password));
      } else if (res.statusCode == 500) {
        throw CustomeException(message: res.data.toString());
      } else {
        throw CustomeException(
            message: "something went wrong. try again later.");
      }
    } on DioException catch (e) {
      handleDioException(e);
    } on CustomeException catch (e) {

      rethrow;
    } catch (e) {

      throw CustomeException(message: "something went wrong");
    }
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
      return false;
    }
  }
}

class ReviewDataSource {
  DioClient dio = DioClient();

  Future<bool> send(ReviewModel review) async {
    try {
      var res = await dio.dio.post("/review", data: review.toJson());

      if (res.statusCode == 200) {
        return true;
      } else
        throw Exception("review failed");
    } catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
      return false;
    }
  }
}
