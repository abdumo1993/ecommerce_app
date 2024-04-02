import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextController extends GetxController {
  SearchController searchController = SearchController();
  validateSearchWord(){
    if(searchController.value.text.trim().isAlphabetOnly&&searchController.value.text.trim().isNotEmpty)
    {
      Get.toNamed("/search", arguments : {"keyword" :searchController.value.text});
    }
  }
}