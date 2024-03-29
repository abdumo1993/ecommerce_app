import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';

void handleDioException(DioException e) {
  if (e.type == DioExceptionType.connectionError ||
      e.type == DioExceptionType.connectionTimeout) {
    throw CustomeException(message: "Connection Error. please try again later");
  }

  else if (e.type == DioExceptionType.badResponse &&  e.response?.statusCode == 401) {
    throw AuthException(message: e.response?.data);
  }
  else if (e.type == DioExceptionType.badResponse) {
    throw e;
  }
  else throw CustomeException(message: "somethin went wrong");
}
