import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/data/datasources/api_client.dart';

class AuthDataSource {
  DioClient dio = DioClient();
  Future<String> login(LoginModel user) async {
    try {
      var res = await dio.dio.post("/auth/login", data: {"email": user.email, "password": user.password});

      if (res.statusCode == 200) {
        // save access and refresh token to the storage 
        // print("the data: ${res.data}");
        print("in the login: ");
        print("${res.data["access_token"]}");
        print("${res.data["refresh_token"]}");
        dio.saveTokens(res.data["access_token"]!, res.data["refresh_token"]);
        // print("the data: ${res.data}");
        return "laf";
      }
      else {
        throw Exception("failed with statuscode: ${res.statusCode}");
      }


    } catch (e) {
      throw Exception("failed to login with exception: $e");
    }
    
  }

  Future<String> register(RegisterModel user) async {
    try {} catch (e) {}
    return "hello";
  }

  Future<String> refresh() async {
    try {} catch (e) {}
    return "hello";
  }

  Future<void> logout() async {
    try {} catch (e) {}
  }
}
