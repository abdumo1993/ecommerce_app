import 'package:ecommerce_app/data/datasources/checkout.dart';
import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/domain/repositories/checkout.dart';

class CheckoutRepositoryImp implements ICheckoutRepository {
  final CheckoutDataSource checkoutDataSource;

  CheckoutRepositoryImp({required this.checkoutDataSource});
  @override
  Future<bool> checkout(List<CartItem?> checkoutItems) async {
   return await checkoutDataSource.checkout(checkoutItems);
  }
  
}