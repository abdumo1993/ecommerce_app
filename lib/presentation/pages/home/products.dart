import 'package:ecommerce_app/data/data_sources/product_local_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/rest_client.dart';
import '../../../data/data_sources/product_remote_data_source_impl.dart';
import '../../../data/repositories/product_repository_impl.dart';
import '../../../domain/usecases/fetch_products_usecase.dart';
import '../../../domain/usecases/fetch_products_usecase_impl.dart';
import '../../controllers/product_controller.dart';
import '../../widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {

 @override
 Widget build(BuildContext context) {


  final productRemoteDataSource = ProductRemoteDataSourceImpl(restClient: RestClient(baseUrl: 'https://fakestoreapi.com/'));
 final productLocalDataSource = ProductLocalDataSource();
 final productRepository = ProductRepositoryImpl(
    remoteDataSource: productRemoteDataSource,
    localDataSource: productLocalDataSource,
 );
  //final productRepository = ProductRepository(remoteDataSource: ProductRemoteDataSourceImpl(restClient: RestClient(baseUrl: 'https://fakestoreapi.com/')));
  final fetchProductsUseCase = FetchProductsUseCaseImpl(productRepository: productRepository);
  Get.put(ProductController(fetchProductsUseCase: fetchProductsUseCase));
 final ProductController productController = Get.find<ProductController>();


    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text('Product List'),
      ),
      body:  Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(() => GridView.builder(
                itemCount: productController.products.length + (productController.hasMore.value ? 1 : 0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (MediaQuery.of(context).size.width * 0.009).floor(),
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  if (index >= productController.products.length) {
                    // Return a loading indicator at the end of the list
                    return Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary,));
                  } else {
                    // Return the product item
                    return ProductItem(product: productController.products[index]);
                  }
                },
                controller: productController.scrollController,
              )),
              ),),
        ],
      ),
    );
 }
}
