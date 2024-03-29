import 'package:ecommerce_app/domain/entities/product.dart';

abstract class FetchProductsUseCase {
  Future<Result<List<Product>>> call({int page = 1, int itemsPerPage = 10});
}

class Result<T> {
  final T? data;
  final String? error;

  Result({this.data, this.error});
}