import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/search_product_usecase.dart';

import 'expansion_controller.dart';
import 'search_text_controller.dart';

class AdminTableController extends GetxController {
  RxInt offset = 0.obs;
  RxInt total = 0.obs;
  RxInt? nextPageKey = 0.obs;
  // String? initialWord;
  var selectedFilters = [].obs;
  // var searchWord = ''.obs;
  bool valid = false;
  RxnString confirmError = RxnString(null);

  SearchController searchWordController = SearchController();

  late ExpansionController expansionController;


  final List<Product> newItems = [];
  final RxList results = [].obs;
  final SearchProductsUseCase searchProductsUseCase;

  AdminTableController(this.searchProductsUseCase) {
      loadPage(nextPageKey?.value);
    // Load the first page
    expansionController = Get.put(ExpansionController());
    // loadPage(offset.value);
  }

  void addFilter(String filter) {
    selectedFilters.add(filter);
  }

  void removeFilter(String filter) {
    selectedFilters.remove(filter);
  }






  final RegExp alphanumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
  void validateSearchWord() {
    if (alphanumericRegex
            .hasMatch(searchWordController.value.text.removeAllWhitespace) ||
        searchWordController.value.text.removeAllWhitespace.isNotEmpty) {
      valid = true;
    } else {
      valid = false;
      confirmError.value = 'Please enter a valid search';
    }
  }

void loadNextPage(){
  loadPage(nextPageKey?.value);
}

  void loadPage(int? pageKey) async {
      await Future.delayed(Duration(milliseconds: 500));
    // validateSearchWord();
    if ( nextPageKey!=null) {
    try {
      List<String> category = selectedFilters.map((element) => element ?? "").toList().cast<String>();
      int low = expansionController.range.value.start.toInt();
      int high = expansionController.range.value.end.toInt();
      int maxSize = int.tryParse(expansionController.pageSize.single) ?? 10;
      SearchModel _searchModel = SearchModel(searchWord: searchWordController.value.text);
      _searchModel.low = low;
      _searchModel.high= high;
      _searchModel.start = pageKey;
      _searchModel.maxSize = maxSize;
      if(category.isNotEmpty){
      _searchModel.category = category;
      }
      
      if (offset.value != -1){
        final newItem = await SearchProduct(
          searchModel:_searchModel);
              // SearchModel(searchWord: searchWordController.value.text,low: low,high: high,maxSize: maxSize,start: pageKey, category: "Elec"));
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
        nextPageKey = null;
        results.addAll(newItems);
      } else {
        nextPageKey = offset;
        results.addAll(newItems);
      }
    } catch (error) {
      //log error
      // print(error);
    }
  }
  }

  @override
  void onClose() {
    // _pagingController.dispose();
    super.onClose();
  }

  @override
  void refresh(){
    offset.value=0;
    total.value = 0;
    newItems.clear();
    nextPageKey = RxInt(0);
    print(nextPageKey);
    results.clear();
    loadNextPage();
    // _pagingController.refresh();
    super.refresh();
  }

  Future<Result<ProductResponseModel>> SearchProduct(
      {required SearchModel searchModel}) async {
    var result = await searchProductsUseCase.call(searchModel: searchModel);
    return result;
  }
}
