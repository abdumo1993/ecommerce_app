import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/data/datasources/checkout.dart';
import 'package:ecommerce_app/data/repositories/checkout.dart';
import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/domain/usecases/checkout.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  void checkout(List<CartItem?> checkoutItems) async {
    try {
      var use = checkoutUseCase(
          repo:
              CheckoutRepositoryImp(checkoutDataSource: CheckoutDataSource()));
      bool checkedout = await use.checkout(checkoutItems);
      if (checkedout == true) {
        Get.toNamed("/Checkout");
      } else {
        Get.snackbar("Failed",
            "Your Cart couldn't be checked out successfully. please try again.");
      }
    } on BadResponseException catch (e) {
// bandle different badresoponses
    } on NetworkException catch (e) {
      Get.toNamed("/error",
          arguments: {"message": e.toString(), "backDest": "/cart"});
    } catch (e) {
      Get.toNamed("/error", arguments: {
        "message": "Unexpected Error occured with: \n$e",
        "backDest": "/cart"
      });
    }
  }
}
