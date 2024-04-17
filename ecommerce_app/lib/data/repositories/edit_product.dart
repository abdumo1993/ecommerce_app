import 'package:ecommerce_app/data/data_sources/edit_product.dart';
import 'package:ecommerce_app/data/data_sources/edit_user.dart';
import 'package:ecommerce_app/domain/entities/edit_user.dart';
import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:ecommerce_app/domain/repositories/edit_product.dart';
import 'package:ecommerce_app/domain/repositories/edit_user.dart';

class EditProductRepositoryImpl implements EditProductRepository{
  final EditProductDataSource editProductProvider;

  EditProductRepositoryImpl({required this.editProductProvider});
  
  @override
  Future<bool> editProduct(AdminProduct product) async {
    try {
      return await editProductProvider.editProduct(product);
    } catch (e) {
      print("repo: $e");
      print("repo ${e.runtimeType}");
      rethrow;
    }
  }
}