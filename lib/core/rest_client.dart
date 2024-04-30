import 'package:dio/dio.dart';

import '../data/datasources/api_client.dart';

class RestClient {
 final String baseUrl;
//  final Dio _dio = Dio();
 final DioClient dio = DioClient();

 RestClient({required this.baseUrl}) {}
//  {
//     _dio.options.baseUrl = baseUrl;
//     _dio.options.headers = {'Content-Type': 'application/json'};
//  }

 Future<Response> get(String endpoint) async {
    // final response = await _dio.get(endpoint);
    final response = await dio.dio.get(endpoint);
    return response;
 }

 Future<Response> post(String endpoint, {Map<String, dynamic>? body}) async {
    // final response = await _dio.post(
    final response = await dio.dio.post(
      endpoint,
      data: body,
    );
    return response;
 }

 Future<Response> put(String endpoint, {Map<String, dynamic>? body}) async {
    // final response = await _dio.put(
    final response = await dio.dio.put(
      endpoint,
      data: body,
    );
    return response;
 }

 Future<Response> delete(String endpoint) async {
    // final response = await _dio.delete(endpoint);
    final response = await dio.dio.delete(endpoint);
    return response;
 }
}
