import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/data/datasources/cart.dart';
import 'package:ecommerce_app/data/repositories/cart.dart';
import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:ecommerce_app/domain/usecases/cart.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

// might need a cart model for this.
class CartController extends GetxController {
  RxInt cItemCount = 0.obs;
  void increaseCIC() {
    cItemCount.value += 1;
  }

  void decreaseCIC() {
    cItemCount.value -= 1;
  }

  void changeCIC(int count) {
    cItemCount(count);
  }

  CartUseCase useCase =
      CartUseCase(repo: CartRepositoryImp(cartDataSource: CartDataSource()));
  void addToCart(Map<String, dynamic> product) async {
    try {
      await useCase.addToCart(product);
      increaseCIC();
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

  void removeFromCart(Map<String, dynamic> product) async {
    try {
      await useCase.removeFromCart(product);
      decreaseCIC();
    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } on BadResponseException catch (e) {
      Get.snackbar("Failed",
          "Failed to remove the product from cart. please try again.");
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } catch (e) {
      print("ukkk: $e");

      Get.toNamed("/error", arguments: {
        "message":
            "Unexpected Error has occured. please try again later later abc.."
      });
    }
  }

  void updateCartItem(Map<String, dynamic> product) async {
    try {
      await useCase.updateCartItem(product);
    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } on BadResponseException catch (e) {
      Get.snackbar("Failed", "Failed to update the product in the cart.");
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } catch (e) {
      print("ukkrrk: $e");

      Get.toNamed("/error", arguments: {
        "message":
            "Unexpected Error has occured. please try again later later adef.."
      });
    }
  }

  Future<List> fetchItems() async {
    try {
      var c = await useCase.fetchItems();
      changeCIC(c[2]!.length);
      return c;
    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
      return [];
    } on BadResponseException catch (e) {
      if (e.statusCode == 404) {
        rethrow;
      } else {
        Get.toNamed("/error", arguments: {"message": e.toString()});
      }
      return [];
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
      return [];
    } catch (e) {
      Get.toNamed("/error", arguments: {
        "message":
            "Unexpected Error has occured. please try again later later aghi.."
      });
      return [];
    }
  }

  void removeAll() async {
    try {
      await useCase.removeAll();
      decreaseCIC();
    } catch (e) {
      Get.snackbar(
          "Failed.", "Failed to clear the cart. please try again later.");
    }
  }
}
