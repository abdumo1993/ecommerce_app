import 'package:ecommerce_app/data/data_sources/search_product_data_source.dart';
import 'package:ecommerce_app/domain/usecases/search_product_usecase.dart';

import '../../domain/entities/product.dart';
import '../../domain/repositories/search_product_repository.dart';

class SearchProductsRepositoryImpl implements SearchProductsRepository{
  final SearchProductsDataSource searchRepo;

  SearchProductsRepositoryImpl({required this.searchRepo});
  
    @override
      Future<Result<ProductResponseModel>> searchProducts(SearchModel searchModel) async{
      try {
      final resultData = await searchRepo.searchProducts(searchModel);
    //  if (resultData.productDtos.isNotEmpty) {
       return Result(data: resultData);
    //  }

    //  return Result(error: 'No products found');
   } catch (e) {
    print(e);
     return Result(error: 'Failed to fetch products');
   }  
    }

}