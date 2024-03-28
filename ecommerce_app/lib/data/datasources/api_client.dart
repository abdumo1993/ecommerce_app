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
          if (e.response?.statusCode == 401 && e.requestOptions.path != "auth/refresh") {
            // print("are we here?");
            String newAccessToken = await refreshToken();
            if (newAccessToken == 'noToken') throw AccessTokenNotFoundExeption();
          
            // print("yes wwe are: $newAccessToken");

            e.requestOptions.headers['Authorization'] =
                'Bearer $newAccessToken';
            return handler.resolve(await _dio.fetch(e.requestOptions));
          } 
          return handler.next(e);
          // return;
        },
      ),
    );
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: 'access_token');
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: 'refresh_token');
  }

  Future<String> refreshToken() async {
    String? newAccessToken;
    try {
      var res = await dio.post("/auth/refresh",
          data: {"refresh_token": await getRefreshToken()});
      if (res.statusCode == 200) {
        print(
            "refreshed successfully. returning new accesstoken... access:${res.data["access_token"]}");
        newAccessToken = res.data["access_token"];
        await saveTokens(res.data["access_token"], null);
      } 
    } catch (e) {
      throw Exception(e.toString());
    }
    newAccessToken ??= "noToken";
    return newAccessToken;
  }

  Future<void> saveTokens(String? accessToken, String? refreshToken) async {
    // print("the tokens a: $accessToken \r r: $refreshToken" );
    try {
      if (accessToken != null) {
        await _storage.write(key: 'access_token', value: accessToken);
      }
      if (refreshToken != null) {
        await _storage.write(key: 'refresh_token', value: refreshToken);
      }
    } catch (e) {
      throw Exception(
          "failed by $e");
    }
  }

  Future<void> deleteTokens() async {
    _storage.delete(key: "access_token");
    _storage.delete(key: "refresh_token");
  }

  Dio get dio => _dio;
}
