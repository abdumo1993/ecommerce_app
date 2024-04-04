import 'package:ecommerce_app/data/datasources/cart.dart';
import 'package:ecommerce_app/data/repositories/cart.dart';
import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:ecommerce_app/domain/usecases/cart.dart';
import 'package:get/get.dart';

// might need a cart model for this.
class CartController extends GetxController {
  CartUseCase useCase =
      CartUseCase(repo: CartRepositoryImp(cartDataSource: CartDataSource()));
  void addToCart(Map<String, int> product) async {
    await useCase.addToCart(CartItem.fromJson(product));
  }

  void removeFromCart(Map<String, int> product) async {
    await useCase.removeFromCart(CartItem.fromJson(product));
  }

  void updateCartItem(Map<String, int> product) async {
    await useCase.updateCartItem(CartItem.fromJson(product));
  }

  Future<List<CartItem?>> fetchItems() async {
    return await useCase.fetchItems();
  }

  void removeAll() async {
await useCase.removeAll();
  }
}
