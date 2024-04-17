import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/core/utils/handleExceptions.dart';
import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:get/get.dart';

// class CartDataSource {
//   DioClient dio = DioClient();
//   Future<bool> addToCart(Map<String, dynamic> item) async {
//     print("called called");
//     try {
//       print("cart: ${item["productId"]} ${item["quantity"]}");
//       var res = await dio.dio.post("cart/add", data: item);
//       if (res.statusCode == 200) {
//         return true;
//       }
//     } on DioException catch (e) {
//       handledioExceptions(e);
//     } catch (e) {
//       return false;
//     }
//     return false;
//   }

//   Future<bool> removeFromCart(Map<String, dynamic> item) async {
//     try {
//       print("removeatbe; ${item["cartItemId"]}");
//       var res = await dio.dio.delete(
//         "cart/remove/${item["cartItemId"]}",
//       );

//       if (res.statusCode == 200) {
//         return true;
//       }
//     } on DioException catch (e) {
//       handledioExceptions(e);
//     } catch (e) {
//       return false;
//     }
//     return false;
//   }

//   Future<bool> updateCartItem(Map<String, dynamic> item) async {
//     try {
//       var res = await dio.dio.put("cart/update", data: item);

//       if (res.statusCode == 200) {
//         print("are we right here?");
//         return true;
//       }
//     } on DioException catch (e) {
//       handledioExceptions(e);
//     } catch (e) {
//       print("use: $e");

//       return false;
//     }
//     return false;
//   }

//   Future<bool> deleteCartItem(CartItem item) async {
//     try {
//       var res = await dio.dio.delete("cart/remove", data: item.toJson());

//       if (res.statusCode == 200) {
//         return true;
//       }
//     } on DioException catch (e) {
//       handledioExceptions(e);
//     } catch (e) {
//       return false;
//     }
//     return false;
//   }

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
//   }

// /*
// try {
//       var res = await dio.dio.get("/cart");
//       print("status: \n\n ${res.statusCode}");
//       if (res.statusCode == 200) {
//         List<CartItem?> itemsList;
//         itemsList = res.data!["data"]["items"]
//             .map((e) => CartItem.fromJson(e))
//             .toList()
//             .cast<CartItem>();
//         // itemsList = [];
//         // print("itemsList: $itemsList");
//         var d = [
//           res.data!["data"]["totalPrice"],
//           res.data!["data"]["cartId"],
//           itemsList
//         ];

//         return d;
//       } else
//         return [];
//     } on DioException catch (e) {
//       print("source: cou: ${e.type}");

//       handledioExceptions(e);
//     } catch (e) {
//       print("souce e: e: $e");
//       rethrow;
//     }
//     return [];
// */
//   Future<bool> removeAll() async {
//     try {
//       var res = await dio.dio.delete("cart/clear");
//       if (res.statusCode == 200) return true;
//     } on DioException catch (e) {
//       handledioExceptions(e);
//     } catch (e) {
//       return false;
//     }
//     return false;
//   }
// }

class CartDataSource {
  DioClient dio = DioClient();
  Future<bool> addToCart(Map<String, dynamic> item) async {
    try {
      var res = await dio.dio.post("cart/add", data: item);
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
      var res = await dio.dio.delete(
        "cart/remove/${item["cartItemId"]}",
      );

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
      print("source e: $e");
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
      print("source e: $e");
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
