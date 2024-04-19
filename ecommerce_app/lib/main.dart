import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:ecommerce_app/presentation/widgets/roleBasedAccessControlWidget.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  Core core = Core();
  await core.setUserData();
  setPathUrlStrategy();

  initUniLinks();
  runApp(const MainApp());

  // handleDeepLink();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // launchUrl(Uri.parse("http://localhost:3000"));
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

StreamSubscription? sub;

void initUniLinks() {
  print("was here");

  sub = linkStream.listen((String? link) {
    print("lins: $link");
    // Handle the received link
    handleLink(link);
  }, onError: (err) {
    // Handle any errors
    print("here ? ");
    print(err);
  });
  print("subb: ${sub}");
}

void handleLink(String? link) {
  // Implement logic to handle the Uni_Link
  print('Received link: $link');
  // Here you can navigate to a specific screen or perform an action based on the link
}
