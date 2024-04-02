import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/search_product_usecase.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'search_text_controller.dart';

class SearchPageController extends GetxController {
  String? initialWord;
  var selectedFilters = [].obs;
  // var searchWord = ''.obs;
  bool valid = false;
  RxnString confirmError = RxnString(null);

  SearchController searchWordController =
      Get.find<SearchTextController>().searchController;

  final PagingController<int, Product> _pagingController =
      PagingController<int, Product>(firstPageKey: 0);
//  final RestClient restClient = RestClient();

  final List<Product> newItems = [];
  final SearchProductsUseCase searchProductsUseCase;

  SearchPageController(this.searchProductsUseCase, this.initialWord) {
    _pagingController.addPageRequestListener((pageKey) {
      loadPage(pageKey);
    });
    // Load the first page
    // if(initialWord!=null) {searchWordController.=initialWord!;}
    loadPage(0);
  }

  void addFilter(String filter) {
    selectedFilters.add(filter);
  }

  void removeFilter(String filter) {
    selectedFilters.remove(filter);
  }






  void validateSearchWord() {
    if (searchWordController.text.trim().isAlphabetOnly &&
        !searchWordController.text.trim().isEmpty) {
      valid = true;
    } else {
      confirmError.value = 'Please enter a valid search';
    }
  }

  Future<void> submitSearch() async {
    validateSearchWord();
    if (valid) {
      // print("searchWord.value: ${searchWord.value}");
      print("searchWordController.value.: ${searchWordController.value.text}");
      final newItem = await SearchProduct(
          searchModel: SearchModel(
              searchWord: searchWordController.value.text,
              category: "Electronics",
              low: 0,
              high: 100));

      if (newItem.data != null) {
        newItems.addAll(newItem.data!);
      } else {
        print(newItem.error);
      }
    }
  }

  PagingController<int, Product> get pagingController => _pagingController;

  void loadPage(int pageKey) async {
    try {
      print("initialWord.value: ${initialWord}");
      // print("searchWord.value: ${searchWord.value}");
      print("searchWordController.value.: ${searchWordController.value.text}");
      final newItem = await SearchProduct(
          searchModel:
              SearchModel(searchWord: searchWordController.value.text));
      if (newItem.data != null) {
        newItems.addAll(newItem.data!);
      } else {
        print(newItem.error);
      }

      // Check if we have more items to load
      final isLastPage = newItems.length > 10;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
      print(error);
    }
  }

  @override
  void onClose() {
    _pagingController.dispose();
    super.onClose();
  }

  Future<Result<List<Product>>> SearchProduct(
      {required SearchModel searchModel}) async {
    var result = await searchProductsUseCase.call(searchModel: searchModel);
    return result;
  }
}
