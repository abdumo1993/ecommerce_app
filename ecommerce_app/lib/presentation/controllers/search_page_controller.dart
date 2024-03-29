import 'package:get/get.dart';

class SearchPageController extends GetxController {
 var selectedFilters = [].obs;

 void addFilter(String filter) {
    selectedFilters.add(filter);
 }

 void removeFilter(String filter) {
    selectedFilters.remove(filter);
 }
}
