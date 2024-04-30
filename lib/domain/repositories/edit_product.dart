import 'package:ecommerce_app/domain/entities/product.dart';

abstract class EditProductRepository {
  Future<bool> editProduct(AdminProduct product);
  Future<AdminProduct?> addProduct(AdminProduct product);
  Future<bool> deleteProduct(int id);
  Future<bool> deleteImage(int id, List imageList);
  Future<AdminProduct?> getProduct(int id);

}