import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/handleExceptions.dart';
import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:get/get.dart';

class CheckoutDataSource {
  DioClient dio = DioClient();
  Future<bool> checkout(List<CartItem?> checkoutItems) async {
    try {
      var res = await dio.dio.post("/api/Checkout",
          data: checkoutItems.map((e) => e!.toJson()).toList());
      if (res.statusCode == 200) return true;
    } on DioException catch (e) {
      handledioExceptions(e);
    } catch (e) {
      return false;
    }
    return false;
  }
}
