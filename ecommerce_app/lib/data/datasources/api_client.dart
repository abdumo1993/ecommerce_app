import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio _dio;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    _dio = Dio();
    _dio.options.baseUrl = dotenv.env["BASE_URL"] ?? "http://localhost:3000";
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // print("this onw");
          String? accessToken = await getAccessToken();
          // print("access still valid access: $accessToken");
          options.headers['Authorization'] = 'Bearer $accessToken';

          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401 &&
              e.requestOptions.path != "auth/refresh") {
            print("loop");
            String newAccessToken = await refreshToken();
            if (newAccessToken == 'noToken')
              throw AccessTokenNotFoundExeption();

            e.requestOptions.headers['Authorization'] =
                'Bearer $newAccessToken';
            return handler.resolve(await _dio.fetch(e.requestOptions));
          }
          if (e.response?.statusCode == 401 && e.requestOptions.path != "auth/refresh") throw RefreshFailedException();
          return handler.next(e);
          // return;
        },
      ),
    );
  }

  Future<String?> getAccessToken() async {
    var access = await _storage.read(key: 'access_token');
    if (access == null) {
      throw AccessTokenNotFoundExeption();
    } else {
      return access;
    }
  }

  Future<String?> getRefreshToken() async {
    var refresh = await _storage.read(key: "refresh_token");
    if (refresh == null) {
      throw RefreshTokenNotFoundExeption();
    } else {
      return refresh;
    }
  }

  Future<String> refreshToken() async {
    String? newAccessToken;

    var res = await dio.post("/auth/refresh",
        data: {"refresh_token": await getRefreshToken(), "access_token": await getAccessToken()});
    if (res.statusCode == 200) {
      print(
          "refreshed successfully. returning new accesstoken... access:${res.data["access_token"]}");
      newAccessToken = res.data["access_token"];
      await saveTokens(res.data["access_token"], null);
    }

    if (newAccessToken == null) {
      throw RefreshFailedException();
    }
    return newAccessToken;
  }

  Future<void> saveTokens(String? accessToken, String? refreshToken) async {
    try {
      if (accessToken != null) {
        await _storage.write(key: 'access_token', value: accessToken);
      }
      if (refreshToken != null) {
        await _storage.write(key: 'refresh_token', value: refreshToken);
      }
    } catch (e) {
      throw CustomeException(message: "something went wrong at: ${runtimeType.toString()}");
    }
  }

  Future<void> deleteTokens() async {
   try { _storage.delete(key: "access_token");
    _storage.delete(key: "refresh_token");}
    catch (e) {
throw LogoutFailedException(message: 'Could not delete credentials. please retry later.');
    }
  }

  Dio get dio => _dio;
}
