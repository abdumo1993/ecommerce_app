import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/domain/repositories/cart.dart';

class CartUseCase {
  final ICartRepository repo;

  CartUseCase({required this.repo});
  
  Future<bool> addToCart(CartItem item) async => await repo.addToCart(item);
  Future<bool> removeFromCart(CartItem item) async => await repo.removeFromCart(item);
  Future<bool> updateCartItem(CartItem item) async => await repo.updateCartItem(item);
  Future<bool> removeAll() async => await repo.removeAll();
  Future<List<CartItem?>> fetchItems() async => await repo.fetchItems();
}