import 'package:ecommerce_app/core/utils/roles.dart';
import 'package:ecommerce_app/presentation/pages/home/home.dart';
import 'package:ecommerce_app/presentation/pages/settings/settings_page.dart';
import 'package:ecommerce_app/presentation/pages/admin/store_page.dart';
import 'package:ecommerce_app/presentation/widgets/roleBasedAccessControlWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List<Widget> pages = [
    HomePage(),
    SettingsPage(),
    StorePage()
  ];
  late Roles r;
  String? role = Get.arguments?['role'];
  Core core = Core();
  NavigationController(){
    // print("nav core.role: ${core.role}");
    if (core.role == 'Admin'){
      r= Roles.ADMIN;
      selectedIndex.value = 2;
    }else{
      r=Roles.CUSTOMER;
    }
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
