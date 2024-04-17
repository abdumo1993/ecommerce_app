import 'package:app_links/app_links.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:ecommerce_app/presentation/pages/auth/login.dart';
import 'package:ecommerce_app/presentation/pages/cart/Cart.dart';
import 'package:ecommerce_app/presentation/pages/checkout/addCheckout.dart';
import 'package:ecommerce_app/presentation/pages/checkout/checkout.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/presentation/pages/entry_page.dart';
import 'package:ecommerce_app/presentation/pages/home/home.dart';
// import 'package:ecommerce_app/presentation/pages/products/productDetail.dart';
import 'package:ecommerce_app/presentation/pages/products/product_detail.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() async {
  await dotenv.load();
  Get.put(ThemeController());
  setPathUrlStrategy();

  runApp(const MainApp());
  // handleDeepLink();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        getPages: routes,
        themeMode: Get.find<ThemeController>().theme.value,
        home: EntryPage(),
      ),
    );
  }
}

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue).copyWith(
  primary: Color(0xFFFFFFFF),
  secondary: Color(0xFFF4F4F4),
  tertiary: Color(0xFF8E6CEF),
  onPrimary: Color(0xFF000000),
  onSecondary: Color(0x272727).withOpacity(0.5),
  onTertiary: Color(0xFFFFFFF),
));

ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue).copyWith(
  primary: Color(0xFF000000),
  secondary: Color(0xFF342F3F),
  tertiary: Color(0xFF8E6CEF),
  onPrimary: Color(0xFFFFFFFF),
  onSecondary: Color(0xFFFFFF).withOpacity(0.5),
  onTertiary: Color(0xFFFFFFF),
));

class ThemeController extends GetxController {
  RxBool isSwitched = false.obs;
  Rx<ThemeMode> theme = ThemeMode.dark.obs;
  void onItemTapped() {
    isSwitched.value = !isSwitched.value;
    if (isSwitched.value) theme.value = ThemeMode.light;
    if (!isSwitched.value) theme.value = ThemeMode.dark;
  }
}
