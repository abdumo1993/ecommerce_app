import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/core/utils/handleExceptions.dart';
import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/domain/entities/auth.dart';
import 'package:ecommerce_app/domain/entities/edit_user.dart';

class AdminUserDataSource {
  DioClient dio = DioClient();
  Future<List<GetUserModel>> fetchUsers() async {
    try {
      var res = await dio.dio.get("/admin/users");
      if (res.statusCode == 200) {
        List? data = res.data;
        if (data != null) {
          return data
              .map((e) {
                return GetUserModel().fromJson(e);
              })
              .toList()
              .cast<GetUserModel>();
        } else
          return [];
      } else
        return [];
    } on DioException catch (e) {
      handledioExceptions(e);
    } catch (e) {
      rethrow;
    }
    return [];
  }

  Future<bool> deleteUser(String id, String email) async {
    try {
      var res = await dio.dio
          .post("/admin/admin-user-delete", data: {"email": email, "id": id});
      if (res.statusCode == 200) {
        return true;
      }
    } on DioException catch (e) {
      print("e: $e");
      handledioExceptions(e);
    } catch (e) {
      rethrow;
    }
    return false;
  }

  Future<bool> register(RegisterModel user) async {
    print("here right?");
    try {
      var res = await dio.dio.post("/admin/admin-register", data: user.toJson());
      if (res.statusCode == 201) {
        return true;
      }
    } on AuthException catch (e) {
      print("auth: $e");
      rethrow;
    } on DioException catch (e) {
      // handle dio exceptions.
      print("dio: ${e.response}");

      handledioExceptions(e);
    } catch (e) {
      print("else: $e");

      throw AuthException(message: "Registeration failed. try again.");
    }
    return false;
  }
}
