import 'package:get/get.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/search_product_usecase.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'expansion_controller.dart';

class HomePageController extends GetxController {
  RxInt offset = 0.obs;
  RxInt total = 0.obs;
  // String? initialWord;
  var selectedFilters = [].obs;
  // var searchWord = ''.obs;
  RxnString confirmError = RxnString(null);
  int currentPage = 0;
  late ExpansionController expansionController;

  final PagingController<int, Product> _pagingController =
      PagingController<int, Product>(firstPageKey: 0, invisibleItemsThreshold: 5);
//  final RestClient restClient = RestClient();

  final List<Product> newItems = [];
  final SearchProductsUseCase searchProductsUseCase;

  HomePageController(this.searchProductsUseCase) {
    _pagingController.addPageRequestListener((pageKey) {
      loadPage(pageKey);
    });
  }


  PagingController<int, Product> get pagingController => _pagingController;

  void loadPage(int pageKey) async {
      // await Future.delayed(Duration(seconds: 2));
    try{if ( _pagingController.nextPageKey!=null) {
    try {
      int maxSize = 10;
      SearchModel _searchModel = SearchModel();
      _searchModel.start = pageKey;
      _searchModel.maxSize = maxSize;
      
      if (offset.value != -1){
        final newItem = await SearchProduct(
          searchModel:_searchModel);
      if (newItem.data != null &&  currentPage != newItem.data!.nextIndex) {
        newItems.clear();
        newItems.addAll(newItem.data!.productDtos);
        offset.value = newItem.data!.nextIndex;
        currentPage = newItem.data!.nextIndex;
        if (total.value == 0)total.value = newItem.data!.total;
      // Check if we have more items to load
      final isLastPage = offset.value==-1;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = offset.value;
        _pagingController.appendPage(newItems, nextPageKey);
      }
      } else {
        //log error
        // print(newItem.error);
      }
      }

    } catch (error) {
      _pagingController.error = error;
      
      print(_pagingController.error.runtimeType);
      //log error
      // print(error);
    }
  }}catch(e){}
  }

  @override
  void onClose() {
    offset.value=0;
    total.value = 0;
    currentPage = 0;
    newItems.clear();
    _pagingController.dispose();
    super.onClose();
  }

  @override
  void refresh(){
    offset.value=0;
    total.value = 0;
    currentPage = 0;
    newItems.clear();
    _pagingController.refresh();
    _pagingController.itemList = null;
    super.refresh();
  }

  Future<Result<ProductResponseModel>> SearchProduct(
      {required SearchModel searchModel}) async {
    var result = await searchProductsUseCase.call(searchModel: searchModel);
    return result;
  }
}
