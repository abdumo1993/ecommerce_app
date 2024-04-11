import 'package:ecommerce_app/core/utils/exceptions.dart';
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
    try {
      await useCase.addToCart(CartItem.fromJson(product));
    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } on BadResponseException catch (e) {
      if (e.statusCode == 200) {}
      // somethings/
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    }
  }

  void removeFromCart(Map<String, int> product) async {
    try {
      await useCase.removeFromCart(CartItem.fromJson(product));
    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } on BadResponseException catch (e) {
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } catch (e) {}
  }

  void updateCartItem(Map<String, int> product) async {
    try {
      await useCase.updateCartItem(CartItem.fromJson(product));
    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } on BadResponseException catch (e) {
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } catch (e) {}
  }

  Future<List<CartItem?>> fetchItems() async {
    try {
      return await useCase.fetchItems();
    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
      return [];
    } on BadResponseException catch (e) {
      return [];
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
      return [];
    } catch (e) {
      return [];
    }
  }

  void removeAll() async {
    try {
      await useCase.removeAll();
    } catch (e) {}
  }
}
