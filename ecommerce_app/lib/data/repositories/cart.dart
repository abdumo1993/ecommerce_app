import 'package:ecommerce_app/data/datasources/cart.dart';
import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/domain/repositories/cart.dart';

class CartRepositoryImp implements ICartRepository {
  final CartDataSource cartDataSource;

  CartRepositoryImp({required this.cartDataSource});
  @override
  Future<bool> addToCart(Map<String, dynamic> item) async {
    print("calle calle ");
    try {
      return await cartDataSource.addToCart(item);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List> fetchItems() async {
    try {
      return await cartDataSource.fetchItems();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> removeFromCart(Map<String, dynamic> item) async {
    try {
      return await cartDataSource.removeFromCart(item);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateCartItem(Map<String, dynamic> item) async {
    try {
      return await cartDataSource.updateCartItem(item);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> removeAll() async {
    try {
      return await cartDataSource.removeAll();
    } catch (e) {
      rethrow;
    }
  }
}
