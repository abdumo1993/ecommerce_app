import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/core/utils/handleExceptions.dart';
import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:get/get.dart';

class CartDataSource {
  DioClient dio = DioClient();
  Future<bool> addToCart(CartItem item) async {
    try {
      var res =
          await dio.dio.post("/api/ShoppingCart/add", data: item.toJson());
      if (res.statusCode == 200) {
        return true;
      }
    } on DioException catch (e) {
      handledioExceptions(e);
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<bool> removeFromCart(CartItem item) async {
    try {
      var res = await dio.dio.delete("/api/ShoppingCart/remove",
          data: {"productId": item.toJson()["productId"]});

      if (res.statusCode == 200) {
        return true;
      }
    } on DioException catch (e) {
      handledioExceptions(e);
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<bool> updateCartItem(CartItem item) async {
    try {
      var res =
          await dio.dio.delete("/api/ShoppingCart/remove", data: item.toJson());

      if (res.statusCode == 200) {
        return true;
      }
    } on DioException catch (e) {
      handledioExceptions(e);
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<List<CartItem?>> fetchItems() async {
    try {
      var res = await dio.dio.get("/api/ShoppingCart/items");
      if (res.statusCode == 200) {
        List<CartItem?> itemsList = res.data!.map((e) {
          return CartItem.fromJson(e);
        }).toList();
        return itemsList;
      }
    } on DioException catch (e) {
      handledioExceptions(e);
    }
    return [];
  }

  Future<bool> removeAll() async {
    try {
      var res = await dio.dio.delete("/api/ShoppingCart/clear");
      if (res.statusCode == 200) return true;
    } on DioException catch (e) {
      handledioExceptions(e);
    } catch (e) {
      return false;
    }
    return false;
  }
}
