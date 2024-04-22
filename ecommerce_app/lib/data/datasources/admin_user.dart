import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/handleExceptions.dart';
import 'package:ecommerce_app/data/datasources/api_client.dart';
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
}
