import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:get/get.dart';

void handleDioExceptions(DioException e) {
  if (e.type == DioExceptionType.connectionError) {
    Get.toNamed("/error", arguments: {"message": "Connection Error. Please connect to Internet and try again."});
    Future.delayed(Duration(seconds: 2), () => Get.back());
  }

   else if (e.type == DioExceptionType.connectionTimeout) {
    Get.toNamed("/error", arguments: {"message": "Connection timeOut. Please try again."});
    Future.delayed(Duration(seconds: 2), () => Get.back());
  }

   else if (e.type == DioExceptionType.sendTimeout) {
    Get.toNamed("/error", arguments: {"message": "Request TimeOut. Please try again."});
    Future.delayed(Duration(seconds: 2), () => Get.back());
  }

  else if (e.type == DioExceptionType.receiveTimeout) {
    Get.toNamed("/error", arguments: {"message": "Response TimeOut. Please try again."});
    Future.delayed(Duration(seconds: 2), () => Get.back());
  }
  else if (e.type == DioExceptionType.badResponse) {
    throw e;
  }
  else {
    Get.toNamed("/error", arguments: {"message": "Something went wrong. try again."});
    Future.delayed(Duration(seconds: 2), () => Get.back());
  }

  
}
