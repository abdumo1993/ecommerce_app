import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:ecommerce_app/domain/repositories/edit_product.dart';

class EditProductCase{
  final EditProductRepository repo;

  EditProductCase({required this.repo});
  
  Future<bool> editProduct(AdminProduct product) async {
    try {
      return await repo.editProduct(product);
    } catch (e) {
      rethrow;
    }
  }
}