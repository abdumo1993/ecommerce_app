import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/domain/entities/product.dart';

class CartItem {
  final int cartItemId;
  final int quantity;
  final double price;
  final PDetailModel product;

  CartItem(
      {required this.cartItemId,
      required this.price,
      required this.product,
      required this.quantity});

  static CartItem fromJson(Map<String, dynamic> json) {
    if (json["cartItemId"] == null) {
      throw CustomeException(message: "cartItemId must not be null.");
    }
    if (json["quantity"] == null || json["quantity"]! < 1) {
      throw CustomeException(
          message:
              "quantity must not be null and must be between greater than 1.");
    }
    print("e: E: ${PDetailModel.fromJson(json["product"]).runtimeType}");
    var e = CartItem(
        cartItemId: json["cartItemId"]!,
        quantity: json["quantity"]!,
        price: json["price"]!.toDouble(),
        // product: PDetailModel.fromJson(json["product"]),
        product: PDetailModel.fromJson(json["product"]));
    print("e: E: $e");
    return e;
  }

  Map<String, dynamic> toJson() {
    return {
      "cartItemId": cartItemId,
      "productId": product.id,
      "quantity": quantity,
      "newQuantity": quantity,
    };
  }
}
