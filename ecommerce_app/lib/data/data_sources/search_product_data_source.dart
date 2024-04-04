import '../../domain/entities/product.dart';

abstract class SearchProductsDataSource{
  Future<ProductResponseModel> searchProducts(SearchModel searchModel);
}