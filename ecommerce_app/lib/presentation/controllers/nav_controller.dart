import 'package:ecommerce_app/presentation/pages/home/home.dart';
import 'package:ecommerce_app/presentation/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List<Widget> pages = [
    HomePage(),
    SettingsPage(),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
