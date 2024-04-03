import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:get/get.dart';
// might need a cart model for this.
class CartController extends GetxController {
  RxList<Product> products = RxList<Product>();
  RxnString errorAdd = RxnString(null);

  void addToCart(Product p) {
    try {
      products.add(p);
    } catch (e) {
      print("in cart: $e");
    }
  }

  void addQuantity(Product p) {

  }
}
