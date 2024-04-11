import 'package:ecommerce_app/domain/entities/cart.dart';
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
}
