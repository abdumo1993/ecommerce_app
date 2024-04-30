import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/data/datasources/order.dart';
import 'package:ecommerce_app/data/repositories/order.dart';
import 'package:ecommerce_app/domain/entities/order.dart';
import 'package:ecommerce_app/domain/usecases/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    fetchOrders();
    super.onInit();
  }

  final orders = RxList<Order>([]);
  var useCase =
      OrderUseCase(repo: OrderRepositoryImp(dataSource: OrderDataSource()));
  void delivered(int id, int status) async {
    try {
      var res = await useCase.delivered(id, status);
      if (res == true) {
        var o = orders.firstWhere((p0) => p0.orderId == id);
        o.status = status;
        orders.refresh();
      }
    } on BadResponseException catch (e) {
      if (e.statusCode == 404) {
        Get.snackbar(
            isDismissible: true,
            duration: Duration(seconds: 10),
            backgroundColor: ThemeData.dark().colorScheme.secondary,
            colorText: ThemeData.dark().colorScheme.onPrimary,
            "Not Exist",
            "The Order doesn't exist");
      } else if (e.statusCode == 400) {
        print(e.message);
        Get.snackbar(
            isDismissible: true,
            duration: Duration(seconds: 10),
            backgroundColor: ThemeData.dark().colorScheme.secondary,
            colorText: ThemeData.dark().colorScheme.onPrimary,
            "Invalid",
            "invalid request.");
      } else if (e.statusCode == 500) {
        Get.toNamed("/error", arguments: {
          "message": "A Server Error has occured. try again later."
        });
      } else if (e.statusCode == 403) {
        Get.toNamed("/error",
            arguments: {"message": "Something went wrong. ${e.toString()}"});
      } else {
        Get.toNamed("/error",
            arguments: {"message": "Something went wrong. ${e.toString()}"});
      }
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } catch (e) {
      Get.toNamed("/error",
          arguments: {"message": "something went wrong. try again later"});
    }
  }

  Order fetchOrder(int id) {
    return orders.firstWhere((element) => element.orderId == id);
  }

  void fetchOrders() async {
    try {
      var res = await useCase.fetchOrders();
      orders(res);
      orders.refresh();
    } on BadResponseException catch (e) {
      if (e.statusCode == 404) {
        orders([]);
      } else if (e.statusCode == 400) {
        Get.snackbar(
            isDismissible: true,
            duration: Duration(seconds: 10),
            backgroundColor: ThemeData.dark().colorScheme.secondary,
            colorText: ThemeData.dark().colorScheme.onPrimary,
            "Invalid",
            "invalid request.");
      } else if (e.statusCode == 500) {
        print(e.toString());
        Get.toNamed("/error", arguments: {
          "message": "A Server Error has occured. try again later."
        });
      }
    } on NetworkException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } on CustomeException catch (e) {
      Get.toNamed("/error", arguments: {"message": e.toString()});
    } catch (e) {
      print(e);
      Get.toNamed("/error",
          arguments: {"message": "something went wrong. try again later"});
    }
  }
}
