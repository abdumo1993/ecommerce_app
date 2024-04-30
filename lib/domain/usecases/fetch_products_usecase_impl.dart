import '../entities/product.dart';
import '../repositories/product_repository.dart';
import 'fetch_products_usecase.dart';

class FetchProductsUseCaseImpl implements FetchProductsUseCase {
 final ProductRepository productRepository;

 FetchProductsUseCaseImpl({required this.productRepository});

 @override
 Future<Result<List<Product>>> call({int page = 1, int itemsPerPage = 10}) async {
    return await productRepository.fetchProducts(page: page, itemsPerPage: itemsPerPage);
 }
}