import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/core/utils/handleExceptions.dart';
import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:get/get.dart';

class CartDataSource {
  DioClient dio = DioClient();
  Future<bool> addToCart(Map<String, dynamic> item) async {
    try {
      var res = await dio.dio.post("/cart/add", data: item);
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

  Future<bool> removeFromCart(Map<String, dynamic> item) async {
    try {
      print(" the id : ${item["cartItemId"]}");
      var res = await dio.dio.delete(
        "/cart/remove/${item["cartItemId"]}",
      );

      if (res.statusCode == 200) {
        return true;
      }
    } on DioException catch (e) {
      print(e);
      handledioExceptions(e);
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<bool> updateCartItem(Map<String, dynamic> item) async {
    try {
      var res = await dio.dio.put("/cart/update", data: item);
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

  Future<bool> deleteCartItem(CartItem item) async {
    try {
      var res = await dio.dio.delete("cart/remove");

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

/*

//   Future<CartModel?> fetchItems() async {
//     try {
//       var res = await dio.dio.get("/cart");
//       if (res.statusCode == 200) {
//         return CartModel.fromJson(res.data);
//       }
//       return null;
//     } on DioException catch (e) {
//       handledioExceptions(e);
//     } catch (e) {
//       rethrow;
//     }
//     return null;
//   } */
  Future<CartModel?> fetchItems() async {
    try {
      var res = await dio.dio.get("/cart");
      if (res.statusCode == 200) {
        return CartModel.fromJson(res.data);
      }
    } on DioException catch (e) {
      handledioExceptions(e);
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<CartItem?> fetch(int cartItemId) async {
    try {
      var res = await dio.dio.get("/cart/$cartItemId");
      if (res.statusCode == 200) {
        return CartItem.fromJson(res.data["data"]);
      }
    } on DioException catch (e) {
      handledioExceptions(e);
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<bool> removeAll() async {
    try {
      var res = await dio.dio.delete("cart/clear");
      if (res.statusCode == 200) return true;
    } on DioException catch (e) {
      handledioExceptions(e);
    } catch (e) {
      return false;
    }
    return false;
  }
}
