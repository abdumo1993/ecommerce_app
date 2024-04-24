import 'package:ecommerce_app/domain/entities/product.dart';

class Order {
  final String orderNumber;
  final int orderId;
  final String status;
  final Map<String, dynamic> shippingAddress;
  final Map<String, dynamic>? billingAddress;
  final PaymentInfo paymentInfo;
  final String orderDate;
  final String updatedAt;
  final List<OrderItem> items;

  const Order({
    required this.orderNumber,
    required this.orderId,
    required this.status,
    required this.shippingAddress,
    this.billingAddress,
    required this.paymentInfo,
    required this.orderDate,
    required this.updatedAt,
    required this.items,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        orderNumber: json["orderNumber"],
        orderId: json['orderId'],
        status: json['status'],
        shippingAddress: json['shippingAddress'],
        paymentInfo: PaymentInfo.formJson(json['paymentInfo']),
        orderDate: json["orderDate"],
        updatedAt: json["updatedAt"],
        items: json["items"]
            ?.map((elem) => OrderItem.formJson(elem))
            .toList()
            .cast<OrderItem>());
  }

  Map<String, dynamic> toJson() {
    return {"status": status};
  }
}

class OrderItem {
  /*
  {
          "orderItemId": 1,
          "quantity": 2,
          "price": 21,
          "product": {
            "id": 11,
            "name": "Sample Product 11 for Automotive",
            "brand": "Seed",
            "count": 8,
            "details": "Seed product details for Automotive",
            "category": 0,
            "images": [],
            "price": 10.5,
            "ratings": []
          },
          "createdAt": "2024-04-24T17:14:14.001619",
          "updatedAt": "2024-04-24T17:14:14.001619"
        }
         */

  final int orderItemId;
  final int quantity;
  final num price;
  final Map<String, dynamic> product;
  final String createdAt;
  final String updatedAt;

  OrderItem(
      {required this.orderItemId,
      required this.quantity,
      required this.price,
      required this.product,
      required this.createdAt,
      required this.updatedAt});
  factory OrderItem.formJson(Map<String, dynamic> json) {
    return OrderItem(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        product: json['product'],
        price: json["price"],
        quantity: json['quantity'],
        orderItemId: json['orderItemId']);
  }
}

class PaymentInfo {
  /*
  {
        "paymentInfoId": 1,
        "amount": 21,
        "currency": "ETB",
        "txRef": "tx638495756381887225",
        "createdAt": "2024-04-24T17:14:13.66922",
        "updatedAt": "2024-04-24T17:14:13.669252"
      },
   */

  final int paymentInfoId;
  final num amount;
  final String currency;
  final String txRef;
  final String createdAt;
  final String updatedAt;

  PaymentInfo(
      {required this.paymentInfoId,
      required this.amount,
      required this.currency,
      required this.txRef,
      required this.createdAt,
      required this.updatedAt});

  factory PaymentInfo.formJson(Map<String, dynamic> json) {
    return PaymentInfo(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        currency: json['currency'],
        txRef: json["txRef"],
        amount: json['amount'],
        paymentInfoId: json['paymentInfoId']);
  }
}
