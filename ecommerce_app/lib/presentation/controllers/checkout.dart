import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/data/datasources/checkout.dart';
import 'package:ecommerce_app/data/repositories/checkout.dart';
import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/domain/entities/checkout.dart';
import 'package:ecommerce_app/domain/usecases/checkout.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CheckoutController extends GetxController {
  final txref = RxnString(null);
  final checkoutUrl = RxnString(null);
  final shippingAddress = RxnInt(null);
  final dynamic orderNumber = Rxn(null);
  final RxList<Map<String, dynamic>> shippingAddressChoices = RxList();



  var useCase = checkoutUseCase(
      repo: CheckoutRepositoryImp(checkoutDataSource: CheckoutDataSource()));

  void launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrlString(url);
    } else {
      throw CustomeException(
          message: "The Url Can not be launched. Please Try again later.");
    }
  }

  void makePayment() async {
    // var body = {"currency": "ETB", "returnUrl": "www.google.com"};

    try {
      var res = await useCase.makePayment(
          CheckoutModel(currency: "ETB", returnUrl: "www.google.com"));

      txref(res?.txref);
      checkoutUrl(res?.txref);
      await fetchAddress();
      launchUrl(checkoutUrl.value!);
    } on BadResponseException catch (e) {
    } on NetworkException catch (e) {
    } on CustomeException catch (e) {
    } catch (e) {}
    // make the payment, recieve txref and checkoutUrl
  }

  Future<void> fetchAddress() async {
    try {
      var res = await useCase.fetchAddresses();
      shippingAddressChoices(res);
      shippingAddressChoices.refresh();
    } on BadResponseException catch (e) {
    } on NetworkException catch (e) {
    } on CustomeException catch (e) {
    } catch (e) {}
  }

  void verify() async {
    try {
      var res = await useCase.verify(
          {"txRef": txref.value!, "shippingAddressId": shippingAddress.value!});
      print("verified");
      orderNumber(res!["orderNumber"]);
    } on BadResponseException catch (e) {
    } on NetworkException catch (e) {
    } on CustomeException catch (e) {
    } catch (e) {}
  }
}
