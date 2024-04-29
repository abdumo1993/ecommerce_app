import 'package:dio/dio.dart';
import 'package:ecommerce_app/domain/entities/product.dart';

import '../usecases/search_product_usecase.dart';

abstract class SearchProductsRepository{
  Future<Result<ProductResponseModel>> searchProducts(CancelToken cancelToken,SearchModel searchModel);
  
}