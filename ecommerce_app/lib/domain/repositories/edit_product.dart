import 'package:ecommerce_app/domain/entities/product.dart';

abstract class EditProductRepository {
  Future<bool> editProduct(AdminProduct product);
}