import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/core/utils/handleExceptions.dart';
import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/domain/entities/product.dart';

class EditProductDataSource{
  DioClient dio = DioClient();
  
    Future<bool> editProduct(AdminProduct product) async {
    try {
      var res = await dio.dio.patch("/product/${product.id}", data: product.toJson());
      if (res.statusCode == 200) {
        // log in
        // return await login(
        //     LoginModel(email: user.email, password: user.password));
        return true;
      }
    } on AuthException catch (e) {
      rethrow;
    } on DioException catch (e) {
      // handle dio exceptions.

      handledioExceptions(e);
    } catch (e) {
      throw AuthException(message: "Editing Product failed. try again.");
    }
    return false;
  }
}