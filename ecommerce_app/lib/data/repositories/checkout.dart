import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/datasources/checkout.dart';
import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/domain/entities/checkout.dart';
import 'package:ecommerce_app/domain/repositories/checkout.dart';

class CheckoutRepositoryImp implements ICheckoutRepository {
  final CheckoutDataSource checkoutDataSource;

  CheckoutRepositoryImp({required this.checkoutDataSource});
  @override
  Future<bool> checkout(List<CartItem?> checkoutItems) async {
    try {
      return await checkoutDataSource.checkout(checkoutItems);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CheckoutResModel?> makePayment(CheckoutModel checkout) async {
    try {
      return await checkoutDataSource.makePayment(checkout);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>?> verify(Map<String, dynamic> data) async {
    try {
      return await checkoutDataSource.verify(data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchAddresses() async{
    try {
      return await checkoutDataSource.fetchAddressess();
    } catch (e) {
      rethrow;
    }
  }
}
