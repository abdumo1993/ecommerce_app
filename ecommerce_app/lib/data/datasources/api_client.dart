import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/core/utils/handleExceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio _dio;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  var excludePaths = ["/auth/refresh", '/auth/login', "/auth/register"];
  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    _dio = Dio();
    _dio.options.baseUrl = dotenv.env["BASE_URL"] ?? "http://localhost:3000";
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          print(options.path);
          String? accessToken = await getAccessToken();
          options.headers['Authorization'] = 'Bearer $accessToken';

          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          // print("onError: $e");
          try {
            if (e.response?.statusCode == 401 &&
                !(excludePaths.contains(e.requestOptions.path))) {
              String newAccessToken = await refreshToken();

              e.requestOptions.headers['Authorization'] =
                  'Bearer $newAccessToken';
              return handler.resolve(await _dio.fetch(e.requestOptions));
            } else {
              throw e;
            }
          } on AuthException catch (e) {
            Get.offNamed("/error", arguments: {
              "message": "An Error has occured: ${e.toString()}"
            });
            Future.delayed(
                Duration(seconds: 2), () => Get.offAllNamed("/login"));
          } on DioException catch (e) {
            if (e.requestOptions.path == "/auth/refresh") {
              Get.offAllNamed("/login",
                  arguments: {"message": "Session Expired. Please login."});
              return;
            } else {
              handler.reject(e);
            }
          } catch (e) {
            Get.offNamed("/error", arguments: {
              "message": "An Error has occured. Please Login again."
            });
            Future.delayed(
                const Duration(seconds: 2), () => Get.offAllNamed("/login"));
          }
        },
      ),
    );
  }

  Future<String?> getAccessToken() async =>
      await _storage.read(key: 'accessToken');

  Future<String?> getRefreshToken() async =>
      await _storage.read(key: "refreshToken");

  Future<String> refreshToken() async {
    try {
      var res = await dio.post("/auth/refresh", data: {
        "refreshToken": await getRefreshToken(),
        "accessToken": await getAccessToken()
      });
      if (res.statusCode == 200) {
        print(
            "refreshed successfully. returning new accesstoken... access:${res.data["accessToken"]}");

        await saveTokens(res.data["accessToken"], res.data["refreshToken"]);
      }
      var newAccesstoken = await getAccessToken();
      if (newAccesstoken != null) {
        return newAccesstoken;
      } else {
        throw AuthException(message: "Refresh failed.");
      }
    } on AuthException catch (e) {
      rethrow;
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      throw AuthException(message: "Refresh failed for unkown reason.");
    }
  }

  Future<void> saveTokens(String? accessToken, String? refreshToken) async {
    try {
      if (accessToken != null && refreshToken != null) {
        await _storage.write(key: 'accessToken', value: accessToken);
        await _storage.write(key: 'refreshToken', value: refreshToken);
      }

      if (accessToken == null || refreshToken == null) {
        throw AuthException(message: "Saving Tokens Failed.");
      }
    } on AuthException catch (e) {
      rethrow;
    } catch (e) {
      throw AuthException(message: "Saving Tokens Failed.");
    }
  }

  Future<void> deleteTokens() async {
    try {
      _storage.delete(key: "accessToken");
      _storage.delete(key: "refreshToken");
    } catch (e) {
      throw AuthException(message: 'Logout failed. Try later.');
    }
  }

  Dio get dio => _dio;
}
