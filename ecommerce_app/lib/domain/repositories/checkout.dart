import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/domain/entities/checkout.dart';

abstract class ICheckoutRepository {
  Future<bool> checkout(List<CartItem?> checkoutItems);
  Future<CheckoutResModel?> makePayment(CheckoutModel checkout);
  Future<Map<String, dynamic>?> verify(Map<String, dynamic> data);
  Future<List<Map<String, dynamic>>> fetchAddresses();
}
