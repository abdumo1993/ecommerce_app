import 'dart:async';
import 'dart:convert';

import 'package:app_links/app_links.dart';
import 'package:ecommerce_app/presentation/controllers/auth.dart';
import 'package:ecommerce_app/presentation/pages/auth/forgotPassword.dart';
import 'package:ecommerce_app/presentation/widgets/roleBasedAccessControlWidget.dart';
import 'package:get/get_navigation/get_navigation.dart';
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
  Get.put(ThemeController(), permanent: true);
  Get.put(GetMaterialController(), permanent: true);
  WidgetsFlutterBinding.ensureInitialized();
  Core core = Core();
  await core.setUserData();
  setPathUrlStrategy();

  try {
    initUniLinks();
  } catch (e) {
    print('performs');
  }
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
// https://red-ecommerce.onrender.com/test/redirect?path=cart
void initUniLinks() {
  print("Initializing deep links...");

  // Ensure the subscription is cancelled when the app is closed to prevent memory leaks
  sub?.cancel();

  sub = linkStream.listen(
    (String? link) {
      print("Received link: ${link.runtimeType}");
      handleLink(link);
    },
    onError: (Object error, StackTrace stackTrace) {
      print("Error occurred while listening to deep links: $error");
      print("Stack trace: $stackTrace");
    },
    onDone: () {
      print("Stream of deep links is closed.");
    },
    cancelOnError: false, // Prevents the stream from being cancelled on error
  );

  print("Deep link subscription initialized: ${sub}");
}

void handleLink(String? link) {
  if (link == null) {
    print("Received null link. Ignoring.");
    return;
  }

  print("Handling link: $link");

  try {
    var uri = Uri.parse(link);
    if (uri.host.isEmpty) {
      print("Invalid URI: Host is empty.");
      return;
    }

    Map<String, String> queryParams = uri.queryParameters;
    print("Query parameters: $queryParams");
    // Assuming the host is used as a route name. Adjust as necessary.
    String routeName = "/${uri.host}";

    // Attempt to navigate to the route. If the route does not exist, GetX will throw an exception.
    try {
      if (routeName == "/email-sent" && queryParams.isNotEmpty) {
        ForgotPasswordController forgotPasswordController =
            Get.put(ForgotPasswordController());

        forgotPasswordController.email(queryParams['email']);
        var token = link.split("token=")[1];
        token = Uri.encodeQueryComponent(token,
            encoding: Encoding.getByName('utf-8')!);
        forgotPasswordController.token(token);
      }
      Get.toNamed(routeName);
    } catch (e) {
      print("Route not found or navigation failed: $routeName. Error: $e");
      // Optionally, navigate to a default route or show an error message
    }
  } catch (e) {
    print("Failed to handle link: $link. Error: $e");
    // Optionally, handle the error more gracefully, e.g., by showing an error message to the user
  }
}
// void handleLink(String? link) {
//   if (link == null) {
//     print("Received null link. Ignoring.");
//     return;
//   }

//   print("Handling link: $link");

//   try {
//     var uri = Uri.parse(link);
//     if (uri.host.isEmpty) {
//       print("Invalid URI: Host is empty.");
//       return;
//     }

//     // Assuming the host is used as a route name. Adjust as necessary.
//     String routeName = "/${uri.host}";

//     // Check if the route exists before navigating
//     if (Get.routing.) {
//       Get.toNamed(routeName);
//     } else {
//       print("Route not found: $routeName");
//       // Optionally, navigate to a default route or show an error message
//     }
//   } catch (e) {
//     print("Failed to handle link: $link. Error: $e");
//     // Optionally, handle the error more gracefully, e.g., by showing an error message to the user
//   }
// }
