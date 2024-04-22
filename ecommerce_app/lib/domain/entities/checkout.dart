class CheckoutModel {
  final String currency;
  final String returnUrl;
  final String? phoneNumber;

  CheckoutModel(
      {required this.currency, required this.returnUrl, this.phoneNumber});

  Map<String, String?> toJson() => {
        "currency": currency,
        "returnUrl": returnUrl,
        "phoneNumber": "0943144152",
      };
}

class CheckoutResModel {
  final String? txref;
  final String? checkoutUrl;

  CheckoutResModel({required this.txref, required this.checkoutUrl});
  factory CheckoutResModel.fromJson(Map<String, dynamic> json) =>
      CheckoutResModel(txref: json["transactionId"], checkoutUrl: json["url"]);
}
