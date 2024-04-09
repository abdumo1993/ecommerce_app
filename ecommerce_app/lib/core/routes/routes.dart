import 'package:ecommerce_app/presentation/pages/ErrorPage.dart';
import 'package:ecommerce_app/presentation/pages/auth/forgotPassword.dart';
import 'package:ecommerce_app/presentation/pages/auth/login.dart';
import 'package:ecommerce_app/presentation/pages/auth/register.dart';
import 'package:ecommerce_app/presentation/pages/cart/Cart.dart';
import 'package:ecommerce_app/presentation/pages/cart/emptyCart.dart';
import 'package:ecommerce_app/presentation/pages/checkout/addCheckout.dart';
import 'package:ecommerce_app/presentation/pages/checkout/checkout.dart';
import 'package:ecommerce_app/presentation/pages/entry_page.dart';
import 'package:ecommerce_app/presentation/pages/home/components/selected_category_page.dart';
import 'package:ecommerce_app/presentation/pages/home/home.dart';
// import 'package:ecommerce_app/presentation/pages/products/productDetail.dart';
import 'package:ecommerce_app/presentation/pages/products/product_detail.dart';
import 'package:ecommerce_app/presentation/pages/search/search_page.dart';
import 'package:ecommerce_app/presentation/pages/settings/address_page.dart';
import 'package:ecommerce_app/presentation/pages/settings/edit_address_page.dart';
import 'package:ecommerce_app/presentation/pages/settings/settings_page.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(name: "/home", page: () => EntryPage()),
  GetPage(name: "/login", page: () => LoginPage()),
  GetPage(name: "/register", page: () => RegisterPage()),
  GetPage(name: "/forgotPassword", page: () => ForgotPassword()),
  GetPage(name: "/emailSent", page: () => EmailSent()),
  GetPage(name: "/cart", page: () => Cart_cart()),
  // to be modified to conditional rendering for empty cart.
  GetPage(name: "/emptyCart", page: () => EmptyCart()),
  GetPage(name: "/addCheckout", page: () => AddCheckout()),
  GetPage(name: "/checkout", page: () => CheckoutPage()),
  GetPage(name: "/productDetail", page: () => ProductDetails()),
  GetPage(name: "/search", page: () => SearchPage()),
  GetPage(name: "/settings", page: () => SettingsPage()),
  GetPage(name: "/address", page: () => AddressPage()),
  GetPage(
      name: "/addAddress",
      page: () => EditAddressPage(
            createNewAddress: true,
          )),
  GetPage(name: "/error", page: () => ErrorPage()),
  GetPage(name: "/selectedCategory", page: () => SelectedCategoryPage())
  // GetPage(name: "/search", page: () => HomePage()),
];
