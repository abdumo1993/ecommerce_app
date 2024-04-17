import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/data/datasources/cart.dart';
import 'package:ecommerce_app/data/repositories/cart.dart';
import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:ecommerce_app/domain/usecases/cart.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

// // might need a cart model for this.
// class CartController extends GetxController {
// /*

// items -> list
// items.quantity -> int

// */
//   RxList<CartItem> cartItems = RxList([]);

//   RxInt cItemCount = 0.obs;

//   void changeQuantity(id, value) {
//     cItemCount(cartItems.length);
//     // print("${cItemCount.value}, ${cartItems.length}");
//     print(cartItems);
//     var item =
//         cartItems[cartItems.indexWhere((element) => element.cartItemId == id)];

//     item.addQuantity = value;
//     cartItems.refresh();
//   }

//   void increaseCIC() {
//     cItemCount.value += 1;
//   }

//   void decreaseCIC() {
//     cItemCount.value -= 1;
//   }

//   void changeCIC(int count) {
//     cItemCount(count);
//   }

//   CartUseCase useCase =
//       CartUseCase(repo: CartRepositoryImp(cartDataSource: CartDataSource()));
//   void addToCart(Map<String, dynamic> product) async {
//     try {
//       await useCase.addToCart(product);
//       increaseCIC();
//       Get.snackbar("Success", "Product Added to cart successfully.");
//     } on CustomeException catch (e) {
//       Get.toNamed("/error", arguments: {"message": e.toString()});
//     } on BadResponseException catch (e) {
//       Get.snackbar("Failed", "Failed to add to Cart. please try again later.");
//       // somethings/
//     } on NetworkException catch (e) {
//       Get.toNamed("/error", arguments: {"message": e.toString()});
//     } catch (e) {
//       Get.toNamed("/error", arguments: {
//         "message": "Unexpected Error has occured!. please try again later."
//       });
//     }
//   }

//   void removeFromCart(Map<String, dynamic> product) async {
//     try {
//       await useCase.removeFromCart(product);
//       decreaseCIC();
//     } on CustomeException catch (e) {
//       Get.toNamed("/error", arguments: {"message": e.toString()});
//     } on BadResponseException catch (e) {
//       Get.snackbar("Failed",
//           "Failed to remove the product from cart. please try again.");
//     } on NetworkException catch (e) {
//       Get.toNamed("/error", arguments: {"message": e.toString()});
//     } catch (e) {
//       print("ukkk: $e");

//       Get.toNamed("/error", arguments: {
//         "message":
//             "Unexpected Error has occured. please try again later later abc.."
//       });
//     }
//   }

//   void updateCartItem(Map<String, dynamic> product) async {
//     print("the prod: $product");
//     try {
//       await useCase.updateCartItem(product);
//       changeQuantity(product["cartItemId"], product["quantity"]);
//     } on CustomeException catch (e) {
//       Get.toNamed("/error", arguments: {"message": e.toString()});
//     } on BadResponseException catch (e) {
//       Get.snackbar("Failed", "Failed to update the product in the cart.");
//     } on NetworkException catch (e) {
//       Get.toNamed("/error", arguments: {"message": e.toString()});
//     } catch (e) {
//       print("ukkrrk: $e");

//       Get.toNamed("/error", arguments: {
//         "message":
//             "Unexpected Error has occured. please try again later later adef.."
//       });
//     }
//   }

//   Future<List> fetchItems() async {
//     try {
//       var c = await useCase.fetchItems();
//       changeCIC(c[2]!.length);
//       // cartItems(c.cast());
//       return c;
//     } on CustomeException catch (e) {
//       Get.toNamed("/error", arguments: {"message": e.toString()});
//       return [];
//     } on BadResponseException catch (e) {
//       if (e.statusCode == 404) {
//         rethrow;
//       } else {
//         Get.toNamed("/error", arguments: {"message": e.toString()});
//       }
//       return [];
//     } on NetworkException catch (e) {
//       Get.toNamed("/error", arguments: {"message": e.toString()});
//       return [];
//     } catch (e) {
//       Get.toNamed("/error", arguments: {
//         "message":
//             "Unexpected Error has occured. please try again later later aghi.."
//       });
//       return [];
//     }
//   }

//   void removeAll() async {
//     try {
//       await useCase.removeAll();
//       decreaseCIC();
//     } catch (e) {
//       Get.snackbar(
//           "Failed.", "Failed to clear the cart. please try again later.");
//     }
//   }
// }

class CartController extends GetxController {
  final cart =
      CartModel(success: false, message: "failed. not found", data: null).obs;

  var useCase =
      CartUseCase(repo: CartRepositoryImp(cartDataSource: CartDataSource()));

  void changeCart(CartModel value) {
    print(cart.value.data?.totalPrice);
    cart(value);
    print(cart.value.data?.totalPrice);
   
  }
void addToCart(Map<String, dynamic> product) async {
    try {
      await useCase.addToCart(product);
      Get.snackbar("Success", "Product Added to cart successfully.");
    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } on BadResponseException catch (e) {
      Get.snackbar("Failed", "Failed to add to Cart. please try again later.");
      // somethings/
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } catch (e) {
      Get.toNamed("/error", arguments: {
        "message": "Unexpected Error has occured!. please try again later."
      });
    }
  }
  Future<CartModel?> fetchItems() async {
    try {
      var cartv2 = await useCase.fetchItems();
      // print(cart?.data?.items[0].product.name);
      changeCart(cartv2!);
      return cart.value;
      // return await useCase.fetchItems();
    } on BadResponseException catch (e) {
      rethrow;
    } on NetworkException catch (e) {
      rethrow;
    } on CustomeException catch (e) {
      rethrow;
    } catch (e) {
      print(e);
      throw Exception("Something went wrong. Try again later.");
    }
  }

  Future<void> updateItem(Map<String, int> json) async {
    try {
      var valid = await useCase.updateCartItem(json);
      if (valid == true) {
        print("valid");
        var item = await useCase.fetchItems();

        changeCart(item!);
      }
    } on BadResponseException catch (e) {
      if (e.statusCode == 404) {
        Get.toNamed("/emptyCart");
      } else if (e.statusCode == 400) {
        Get.snackbar("Invalid", "invalid request.");
      } else if (e.statusCode == 500) {
        Get.toNamed("/error", arguments: {
          "message": "A Server Error has occured. try again later."
        });
      }
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } catch (e) {
      print("e: $e");
      Get.toNamed("/error",
          arguments: {"message": "something went wrong. try again later"});
    }
  }

  Future<void> deleteItem(Map<String, int> json) async {
try {
      var valid = await useCase.removeFromCart(json);
      if (valid == true) {
        print("valid");
        var item = await useCase.fetchItems();

        changeCart(item!);
      }
    } on BadResponseException catch (e) {
      if (e.statusCode == 404) {
        Get.toNamed("/emptyCart");
      } else if (e.statusCode == 400) {
        Get.snackbar("Invalid", "invalid cart item Iid.");
      } else if (e.statusCode == 500) {
        Get.toNamed("/error", arguments: {
          "message": "A Server Error has occured. try again later."
        });
      }
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } catch (e) {
      print("e: $e");
      Get.toNamed("/error",
          arguments: {"message": "something went wrong. try again later"});
    }
  }

}
