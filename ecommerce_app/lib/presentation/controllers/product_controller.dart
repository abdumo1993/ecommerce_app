import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/fetch_products_usecase.dart';

class ProductController extends GetxController {
 final FetchProductsUseCase fetchProductsUseCase;
 final ScrollController scrollController = ScrollController();
 var products = <Product>[].obs;
 var isLoading = false.obs;
 var hasMore = true.obs;
 int currentPage = 1;


 ProductController({required this.fetchProductsUseCase});

 @override
 void onInit() {
    super.onInit();
    fetchProducts();
    scrollController.addListener(_scrollListener);
 }
 void _scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !isLoading.value && hasMore.value) {
      fetchProducts();
    }
 }

 @override
 void onClose() {
    scrollController.dispose();
    super.onClose();
 }


 Future<void> fetchProducts() async {
    if (!hasMore.value || isLoading.value) return;
    isLoading.value = true;
    try {
      final result = await fetchProductsUseCase.call(page: currentPage, itemsPerPage: 10);
      if (result.error != null) {
        // Handle error
      } else {
        products.addAll(result.data!);
        currentPage++;
        if (result.data!.length < 10) {
          hasMore.value = false;
        }
      }
    } catch (e) {
      // Handle error
    } finally {
      isLoading.value = false;
    }
 }
}
