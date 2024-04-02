import 'package:ecommerce_app/domain/entities/product.dart';

abstract class SearchProductsUseCase {
  Future<Result<List<Product>>> call({required SearchModel searchModel});
}

class Result<T> {
  final T? data;
  final String? error;

  Result({this.data, this.error});
}