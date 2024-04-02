import 'package:ecommerce_app/domain/entities/product.dart';

import '../repositories/search_product_repository.dart';
import 'search_product_usecase.dart';

class SearchProductsUseCaseImpl implements SearchProductsUseCase{
 final SearchProductsRepository searchRepo;

 
SearchProductsUseCaseImpl({required this.searchRepo});


  @override
  Future<Result<List<Product>>> call({required SearchModel searchModel}) async {
    return await searchRepo.searchProducts(searchModel);
  }

 
  
}