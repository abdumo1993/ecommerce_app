class CartItem {
  final int productId;
  final int quantity;

  CartItem({required this.productId, required this.quantity});

  static fromJson(Map<String, int> json) {
    if (json["productId"] == null) {
      throw Exception("productID must not be null.");
    }
    if (json["quantity"] == null || json["quantity"]! < 1) {
      throw Exception("quantity must not be null and must be between 1 and 5.");
    }
    return CartItem(productId: json["productId"]!, quantity: json["quantity"]!);
  }

  Map<String, int> toJson() {
    return {"productId": productId, "quantity": quantity};
  }
}
