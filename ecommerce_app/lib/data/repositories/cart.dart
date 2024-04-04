import 'package:ecommerce_app/data/datasources/cart.dart';
import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/domain/repositories/cart.dart';

class CartRepositoryImp implements ICartRepository {
  final CartDataSource cartDataSource;

  CartRepositoryImp({required this.cartDataSource});
  @override
  Future<bool> addToCart(CartItem item) async {
    return await cartDataSource.addToCart(item);
  }

  @override
  Future<List<CartItem?>> fetchItems() async {
   return await cartDataSource.fetchItems();
  }

  @override
  Future<bool> removeFromCart(CartItem item) async {
    return await cartDataSource.removeFromCart(item);
  }

  @override
  Future<bool> updateCartItem(CartItem item) async {
   return await cartDataSource.updateCartItem(item);
  }
  
  @override
  Future<bool> removeAll() async {
    return await cartDataSource.removeAll();
  }
}
