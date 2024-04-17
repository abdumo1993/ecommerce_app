import 'package:ecommerce_app/domain/entities/cart.dart';

abstract class ICartRepository {
  Future<bool> addToCart(Map<String, dynamic> item);
  Future<bool> removeFromCart(Map<String, dynamic> item);
  Future<bool> updateCartItem(Map<String, dynamic> item);
  Future<bool> removeAll();
  Future<CartModel?> fetchItems();
  Future<CartItem?> fetch(int cartItemId);
}
