import 'package:ecommerce_app/domain/entities/cart.dart';

abstract class ICheckoutRepository {
  Future<bool> checkout(List<CartItem?> checkoutItems);
}