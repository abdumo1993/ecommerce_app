

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpansionController extends GetxController{
  var range = RangeValues(0, 1000).obs;
  List<bool> isOpen = <bool>[false,false].obs;

  var pageSize = {"2"}.obs;
  void changeRange(RangeValues value){
    if(value.start!=value.end){
        range.value = value;
    }
  }
  
  void changeSize(Set<String> value){
    pageSize.clear();
    pageSize.add(value.single);
  }
}
