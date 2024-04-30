import '../../data/data_sources/product_remote_data_source.dart';
import '../entities/product.dart';
import '../usecases/fetch_products_usecase.dart'; // Assuming you have a Result class for handling success and error states

class ProductRepository {
 final ProductRemoteDataSource remoteDataSource;

 ProductRepository({required this.remoteDataSource});

 Future<Result<List<Product>>> fetchProducts({int page = 1, int itemsPerPage = 10}) async {
    try {
      final result = await remoteDataSource.fetchProducts(page: page, itemsPerPage: itemsPerPage);
        return Result(data: result);
      
    } catch (e) {
      return Result(error: 'Failed to fetch products');
    }
 }
}
