import 'dart:convert';
import 'package:ecommerce_app/domain/entities/product.dart';
import '../../core/rest_client.dart';
import '../datasources/api_client.dart';
import 'product_remote_data_source.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
 final RestClient restClient;
 final DioClient dio = DioClient();

 ProductRemoteDataSourceImpl({required this.restClient});

 @override
 Future<List<Product>> fetchProducts({required int page, required int itemsPerPage}) async {
    //final response = await restClient.get('https://example.com/api/items?page=$page&itemsPerPage=$itemsPerPage');
    final response = await restClient.get('products?limit=$itemsPerPage');
    // dio.dio.get("path");
    if (response.statusCode == 200) {
      List<dynamic> body = response.data;
      return body.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch items');
    }
 }
}
