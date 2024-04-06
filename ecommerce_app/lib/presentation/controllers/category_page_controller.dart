import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/search_product_usecase.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'expansion_controller.dart';

class CategoryPageController extends GetxController {
  RxInt offset = 0.obs;
  RxInt total = 0.obs;
  // String? initialWord;
  var selectedFilters = [].obs;
  // var searchWord = ''.obs;
  RxnString confirmError = RxnString(null);

  late ExpansionController expansionController;

  final PagingController<int, Product> _pagingController =
      PagingController<int, Product>(firstPageKey: 0);
//  final RestClient restClient = RestClient();

  final List<Product> newItems = [];
  final SearchProductsUseCase searchProductsUseCase;

  CategoryPageController(this.searchProductsUseCase) {
    _pagingController.addPageRequestListener((pageKey) {
      loadPage(pageKey);
    });
  }

  void addFilter(String filter) {
    selectedFilters.add(filter);
  }

  void removeFilter(String filter) {
    selectedFilters.remove(filter);
  }






  // void validateSearchWord() {
  //   if (searchWordController.text.trim().isAlphabetOnly &&
  //       !searchWordController.text.trim().isEmpty) {
  //     valid = true;
  //   } else {
  //     valid = false;
  //     confirmError.value = 'Please enter a valid search';
  //   }
  // }


  PagingController<int, Product> get pagingController => _pagingController;

  void loadPage(int pageKey) async {
      // await Future.delayed(Duration(seconds: 2));
    if ( _pagingController.nextPageKey!=null) {
    try {
      int maxSize = 10;
      SearchModel _searchModel = SearchModel();
      _searchModel.start = pageKey;
      _searchModel.maxSize = maxSize;
      _searchModel.category = [Get.parameters["category"]];
      
      if (offset.value != -1){
        final newItem = await SearchProduct(
          searchModel:_searchModel);
      if (newItem.data != null) {
        newItems.clear();
        newItems.addAll(newItem.data!.productDtos);
        offset.value = newItem.data!.nextIndex;
        if (total.value == 0)total.value = newItem.data!.total;
      } else {
        //log error
        // print(newItem.error);
      }
      }

      // Check if we have more items to load
      final isLastPage = offset.value==-1;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = offset.value;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
      //log error
      // print(error);
    }
  }
  }

  @override
  void onClose() {
    offset.value=0;
    total.value = 0;
    newItems.clear();
    _pagingController.dispose();
    super.onClose();
  }

  @override
  void refresh(){
    offset.value=0;
    total.value = 0;
    newItems.clear();
    _pagingController.refresh();
    super.refresh();
  }

  Future<Result<ProductResponseModel>> SearchProduct(
      {required SearchModel searchModel}) async {
    var result = await searchProductsUseCase.call(searchModel: searchModel);
    return result;
  }
}
