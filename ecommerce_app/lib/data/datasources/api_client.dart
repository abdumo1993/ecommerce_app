import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/core/utils/handleExceptions.dart';
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
          String? accessToken = await getAccessToken();
          options.headers['Authorization'] = 'Bearer $accessToken';

          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          try {
            if (e.response?.statusCode == 401 &&
                !(excludePaths.contains(e.requestOptions.path))) {
              String newAccessToken = await refreshToken(); // may throw customeExcepiton 

              e.requestOptions.headers['Authorization'] =
                  'Bearer $newAccessToken';
              return handler.resolve(await _dio.fetch(e.requestOptions));
            }

            return handler.next(e);
          } on DioException catch (e) {
            handleDioExceptions(e);
          } on CustomeException catch (e) {
            Get.toNamed("/error", arguments: {"message" : e.toString()});
            Future.delayed(Duration(seconds: 2), () => Get.back());
          }
          // return;
        },
      ),
    );
  }

  Future<String?> getAccessToken() async {
    var access = await _storage.read(key: 'accessToken');

    return access;
  }

  Future<String?> getRefreshToken() async {
    var refresh = await _storage.read(key: "refreshToken");
    if (refresh == null) {
      throw CustomeException(message: "Invalid Credentials line56");
      
    } else {
      return refresh;
    }
  }

  Future<String> refreshToken() async {
    String? newAccessToken;

    var res = await dio.post("/auth/refresh", data: {
      "refreshToken": await getRefreshToken(),
      "accessToken": await getAccessToken()
    });
    if (res.statusCode == 200) {
      print(
          "refreshed successfully. returning new accesstoken... access:${res.data["accessToken"]}");
      newAccessToken = res.data["accessToken"];
      await saveTokens(res.data["accessToken"], res.data["refreshToken"]);
    }

    if (newAccessToken == null) {
      print("in api line 82");

      throw CustomeException(message: "Invalid Credentials line77");
    }
    return newAccessToken;
  }

  Future<void> saveTokens(String? accessToken, String? refreshToken) async {
    try {
      if (accessToken != null && refreshToken != null) {
        await _storage.write(key: 'accessToken', value: accessToken);
        await _storage.write(key: 'refreshToken', value: refreshToken);
      }

      if (accessToken == null || refreshToken == null) {
        print("in api line 97");

        throw CustomeException(message: "Invalid Credentials line93");
      }
      ;
    } catch (e) {
      throw CustomeException(
          message: "something went wrong at: ${runtimeType.toString()}");
    }
  }

  Future<void> deleteTokens() async {
    try {
      _storage.delete(key: "accessToken");
      _storage.delete(key: "refreshToken");
    } catch (e) {
      throw CustomeException(message: 'Logout failed. Try later.');
    }
  }

  Dio get dio => _dio;
}
