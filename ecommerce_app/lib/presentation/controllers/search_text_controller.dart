import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextController extends GetxController {
  SearchController searchController = SearchController();
  final RegExp alphanumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
  validateSearchWord(){
    if(alphanumericRegex.hasMatch(searchController.value.text.removeAllWhitespace)&&searchController.value.text.removeAllWhitespace.isNotEmpty)
    {
      Get.toNamed("/search", arguments : {"keyword" :searchController.value.text});
    }
  }
}