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
      var res = await dio.dio.post("/auth/login", data: user.toJson());

      if (res.statusCode == 200) {
        // save access and refresh token to the storage

        await dio.saveTokens(res.data["accessToken"], res.data["refreshToken"]);
        return true;
      }
    } on AuthException catch (e) {
      rethrow;
    } on DioException catch (e) {
      // handle dio exceptions.
      handledioExceptions(e);
    } catch (e) {
      throw AuthException(message: "Registeration failed. try again.");
    }
    return false;
  }

  Future<bool> register(RegisterModel user) async {
    try {
      var res = await dio.dio.post("/auth/register", data: user.toJson());
      if (res.statusCode == 201) {
        // log in
        // return await login(
        //     LoginModel(email: user.email, password: user.password));
        await dio.saveTokens(res.data["accessToken"], res.data["refreshToken"]);
        return true;
      }
    } on AuthException catch (e) {
      rethrow;
    } on DioException catch (e) {
      // handle dio exceptions.

      handledioExceptions(e);
    } catch (e) {
      throw AuthException(message: "Registeration failed. try again.");
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
      if (res.statusCode == 204) {
        return true;
      }
    } on DioException catch (e) {
      handledioExceptions(e);
    }
    return false;
  }

  Future<Map<String, dynamic>> fetch(int pid) async {
    try {
      var res = await dio.dio.get("/product/$pid/rating");
      if (res.statusCode == 200) {
        return {
          "reviews":
              res.data["reviews"]?.map((e) => ReviewModel.fromJson(e)).toList(),
          "rating": res.data["rating"] ?? 3
        };
      }
    } on DioException catch (e) {
      handledioExceptions(e);
    }
    return {};
  }
}

class PDetailDataSource {
  DioClient dio = DioClient();

  Future<PDetailModel?> fetch(int id) async {
    try {
      var res = await dio.dio.get("/product/$id");
      if (res.statusCode == 200) {
        var b = PDetailModel.fromJson(res.data);
        return b;
      }
    } on DioException catch (e) {
      handledioExceptions(e);
    }
    return null;
  }
}
