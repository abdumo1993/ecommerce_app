import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/domain/entities/checkout.dart';
import 'package:ecommerce_app/domain/repositories/checkout.dart';

class checkoutUseCase {
  final ICheckoutRepository repo;

  checkoutUseCase({required this.repo});

  Future<bool> checkout(List<CartItem?> checkoutItems) async {
    try {
      return await repo.checkout(checkoutItems);
    } catch (e) {
      rethrow;
    }
  }

  Future<CheckoutResModel?> makePayment(CheckoutModel checkout) async {
    try {
      return await repo.makePayment(checkout);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> verify(Map<String, dynamic> data) async {
    try {
      return await repo.verify(data);
    } catch (e) {
      rethrow;
    }
  }
   Future<List<Map<String, dynamic>>> fetchAddresses() async {
    try {
      return await repo.fetchAddresses();
    } catch (e) {
      rethrow;
    }
  }
}
