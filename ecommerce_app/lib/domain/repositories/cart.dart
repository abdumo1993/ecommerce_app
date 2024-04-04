import 'package:ecommerce_app/domain/entities/cart.dart';

abstract class ICartRepository {
  Future<bool> addToCart(CartItem item);
  Future<bool> removeFromCart(CartItem item);
  Future<bool> updateCartItem(CartItem item);
  Future<bool> removeAll();
  Future<List<CartItem?>> fetchItems();

}