import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:get/get.dart';

void handleDioExceptions(DioException e) {
  if (e.type == DioExceptionType.connectionError) {
    Get.toNamed("/error", arguments: {
      "message": "Connection Error. Please connect to Internet and try again."
    });
  } else if (e.type == DioExceptionType.connectionTimeout) {
    Get.toNamed("/error",
        arguments: {"message": "Connection timeOut. Please try again."});
  } else if (e.type == DioExceptionType.sendTimeout) {
    Get.toNamed("/error",
        arguments: {"message": "Request TimeOut. Please try again."});
  } else if (e.type == DioExceptionType.receiveTimeout) {
    Get.toNamed("/error",
        arguments: {"message": "Response TimeOut. Please try again."});
  } else if (e.type == DioExceptionType.badResponse) {
    throw e;
  } else {
    Get.toNamed("/error",
        arguments: {"message": "Something went wrong. try again."});
  }
}

void handledioExceptions(DioException e) {
  if (e.type == DioExceptionType.connectionError) {
    throw NetworkException(message: "Connection Error. Try again later");
  } else if (e.type == DioExceptionType.connectionTimeout) {
    throw NetworkException(message: "Connection TimeOut. Try again later");
  } else if (e.type == DioExceptionType.sendTimeout) {
    throw NetworkException(message: "Request TimeOut. Try again later");
  } else if (e.type == DioExceptionType.receiveTimeout) {
    throw NetworkException(message: "Response TimeOut. Try again later");
  } else if (e.type == DioExceptionType.badResponse) {
    throw BadResponseException(
        message: e.response?.data, statusCode: e.response?.statusCode);
  } else {
    throw CustomeException(message: "Something went wrong");
  }
}
