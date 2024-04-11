import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/domain/repositories/cart.dart';

class CartUseCase {
  final ICartRepository repo;

  CartUseCase({required this.repo});

  Future<bool> addToCart(CartItem item) async {
    try {
      return await repo.addToCart(item);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> removeFromCart(CartItem item) async {
    try {
      return await repo.removeFromCart(item);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateCartItem(CartItem item) async {
    try {
      return await repo.updateCartItem(item);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> removeAll() async {
    try {
      return await repo.removeAll();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CartItem?>> fetchItems() async {
    try {
      return await repo.fetchItems();
    } catch (e) {
      rethrow;
    }
  }
}
