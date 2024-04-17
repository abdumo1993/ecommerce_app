import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/core/utils/handleExceptions.dart';
import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/domain/entities/checkout.dart';
import 'package:get/get.dart';

class CheckoutDataSource {
  DioClient dio = DioClient();
  Future<bool> checkout(List<CartItem?> checkoutItems) async {
    // try {
    //   var res = await dio.dio.post("/api/Checkout",
    //       data: checkoutItems.map((e) => e!.toJson()).toList());
    //   if (res.statusCode == 200) return true;
    // } on DioException catch (e) {
    //   handledioExceptions(e);
    // } catch (e) {
    //   return false;
    // }
    return false;
  }

  Future<CheckoutResModel?> makePayment(CheckoutModel checkout) async {
    try {
      var res =
          await dio.dio.post("/payment/makePayment", data: checkout.toJson());
      if (res.statusCode == 200) {
        return CheckoutResModel.fromJson(res.data);
      }
    } on DioException catch (e) {
      handledioExceptions(e);
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<Map<String, dynamic>> verify(Map<String, dynamic> data) async {
    try {
      var res = await dio.dio.get("/payment/verifypayment", data: data);
      if (res.statusCode == 200) {
        return res.data;
      }
    } on DioException catch (e) {
      handledioExceptions(e);
    } catch (e) {
      rethrow;
    }
    return {};
  }

  Future<List<Map<String, dynamic>>> fetchAddressess() async {
    try {
      var res = await dio.dio.get("/address/shipping");
      if (res.statusCode == 200) {
        return res.data;
      }
    } on DioException catch (e) {
      handledioExceptions(e);
    } catch (e) {
      rethrow;
    }
    return [];
  }
}
