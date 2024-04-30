import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/fetch_products_usecase.dart';
import '../data_sources/product_local_data_source.dart';
import '../data_sources/product_remote_data_source.dart'; // Assuming you have a Result class for handling success and error states

class ProductRepositoryImpl implements ProductRepository {
 final ProductRemoteDataSource remoteDataSource;
 final ProductLocalDataSource localDataSource;

 ProductRepositoryImpl({
   required this.remoteDataSource,
   required this.localDataSource,
 });

 @override
 Future<Result<List<Product>>> fetchProducts({int page = 1, int itemsPerPage = 10}) async {
   try {
     // First, try to fetch products from the local data source
    //  final localProducts = await localDataSource.fetchProducts(page: page, itemsPerPage: itemsPerPage);
    //  if (localProducts.isNotEmpty) {
    //    return Result(data: localProducts);
    //  }

     // If local data source is empty, fetch from the remote data source
     final remoteProducts = await remoteDataSource.fetchProducts(page: page, itemsPerPage: itemsPerPage);
     if (remoteProducts.isNotEmpty) {
       // Optionally, save the fetched products to the local data source for future use
      //  await localDataSource.saveProducts(remoteProducts);
       return Result(data: remoteProducts);
     }

     return Result(error: 'No products found');
   } catch (e) {
     return Result(error: 'Failed to fetch products');
   }
 }
}
