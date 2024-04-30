

import 'package:ecommerce_app/domain/entities/product.dart';

abstract class ProductRemoteDataSource {
 Future<List<Product>> fetchProducts({required int page, required int itemsPerPage});
}
