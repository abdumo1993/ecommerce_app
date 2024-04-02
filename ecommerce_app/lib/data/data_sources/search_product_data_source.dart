import '../../domain/entities/product.dart';

abstract class SearchProductsDataSource{
  Future<List<Product>> searchProducts(SearchModel searchModel);
}