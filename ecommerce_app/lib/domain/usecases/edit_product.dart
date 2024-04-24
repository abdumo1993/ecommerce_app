import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:ecommerce_app/domain/repositories/edit_product.dart';

class EditProductCase{
  final EditProductRepository repo;

  EditProductCase({required this.repo});
  
  Future<bool> editProduct(AdminProduct product) async {
    try {
      return await repo.editProduct(product);
    } catch (e) {print("e.runtimeType:${e.runtimeType}");
      rethrow;
    }
  }
  
  Future<AdminProduct?> addProduct(AdminProduct product) async {
    try {
      return await repo.addProduct(product);
    } catch (e) {print("e.runtimeType:${e.runtimeType}");
      rethrow;
    }
  }
  Future<bool> deleteProduct(int id) async {
    try {
      return await repo.deleteProduct(id);
    } catch (e) {print("e.runtimeType:${e.runtimeType}");
      rethrow;
    }
  }
Future<bool> deleteImage(int id, List imageList) async {
    try {
      return await repo.deleteImage(id, imageList);
    } catch (e) {print("e.runtimeType:${e.runtimeType}");
      rethrow;
    }
  }
Future<AdminProduct?> getProduct(int id) async {
    try {
      return await repo.getProduct(id);
    } catch (e) {print("e.runtimeType:${e.runtimeType}");
      rethrow;
    }
  }
}