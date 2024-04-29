import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/handleExceptions.dart';
import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/domain/entities/order.dart';

class OrderDataSource {
  DioClient dio = DioClient();
  Future<List<Order>> fetchOrders() async {
    try {
      var res = await dio.dio.get("/order");
      if (res.statusCode == 200) {
        return res.data["data"]
                ?.map((elem) {
                  return Order.fromJson(elem);
                })
                .toList()
                .cast<Order>() ??
            [];
      }
    } on DioException catch (e) {
      handledioExceptions(e);
    } catch (e) {
      rethrow;
    }
    return [];
  }

  Future<bool> delivered(int id, int status) async {
    try {
      var res = await dio.dio.patch("/order/status/$id", data: status);
      if (res.statusCode == 200) {
        return true;
      }
    } on DioException catch (e) {
      handledioExceptions(e);
    } catch (e) {
      rethrow;
    }
    return false;
  }
}
