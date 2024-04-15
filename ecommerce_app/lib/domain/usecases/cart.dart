import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/domain/repositories/cart.dart';

class CartUseCase {
  final ICartRepository repo;

  CartUseCase({required this.repo});

  Future<bool> addToCart(Map<String, dynamic> item) async {
    print("call call ");

    try {
      return await repo.addToCart(item);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> removeFromCart(Map<String, dynamic> item) async {
    try {
      return await repo.removeFromCart(item);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateCartItem(Map<String, dynamic> item) async {
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

  Future<List> fetchItems() async {
    try {
      return await repo.fetchItems();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
