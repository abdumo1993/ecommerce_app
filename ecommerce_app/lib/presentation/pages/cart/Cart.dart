import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/presentation/controllers/cart.dart';
import 'package:ecommerce_app/presentation/controllers/checkout.dart';
import 'package:ecommerce_app/presentation/pages/ErrorPage.dart';
import 'package:ecommerce_app/presentation/pages/cart/emptyCart.dart';
import 'package:ecommerce_app/presentation/pages/products/product_detail.dart';
import 'package:ecommerce_app/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Cart_cart extends StatelessWidget {
  const Cart_cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    CheckoutController checkoutController = Get.put(CheckoutController());
    return FutureBuilder(
      future: controller.fetchItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CartView(shimmer: true);
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data == null) {
          return ErrorPage(
              message: "Couldn't fetch cart items. try again later.");
        } else {
          print(snapshot.data);
          if (snapshot.data!.length == 0) {
            return EmptyCart();
          } else {
            var cartitems = snapshot.data!;
            return CartView(items: cartitems, shimmer: false);
          }
        }
      },
    );
  }
}

class CartView extends StatelessWidget {
  final bool shimmer;
  final List<CartItem?>? items;
  const CartView({super.key, this.shimmer = false, this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: Container(
          width: 800,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: GestureDetector(
              onTap: () {
                if (items != null) {
                  Get.find<CheckoutController>().checkout(items!);
                }
                
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).colorScheme.tertiary),
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(16),
                  child: Center(
                      heightFactor: 1,
                      child: Text("Checkout",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16)))),
            ),
            body: Container(
              color: Theme.of(context).colorScheme.primary,
              padding: EdgeInsets.all(20.0),
              child: Center(
                heightFactor: 1,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width < 800
                              ? MediaQuery.of(context).size.width
                              : 800,
                          child: Row(
                            children: [
                              const backButton(),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Checkout",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.find<CartController>();
                          },
                          child: Text(
                            "Remove All",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        shimmer ? myShimmerForm() : myForm(),
                        SizedBox(
                          height: 120,
                        ),
                        shimmer ? myShimmerTotal() : myTotal(),
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          color: Theme.of(context).colorScheme.secondary,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "lib/assets/images/Vector2.png",
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Enter Coupon Code",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ContinueButton(
                                  onPress: () => print('hello'),
                                  child: Image.asset(
                                    "lib/assets/images/arrowright2.png",
                                    fit: BoxFit.contain,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class myShimmerTotal extends StatelessWidget {
  const myShimmerTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerContainer(
                width: 150,
                height: 30,
              ),
              ShimmerContainer(width: 100, height: 30),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerContainer(width: 150, height: 30),
              ShimmerContainer(width: 100, height: 30),
            ],
          ),
        ],
      ),
    );
  }
}

class myTotal extends StatelessWidget {
  const myTotal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subtotal",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary)),
              Text("\$200",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shipping Cost",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary)),
              Text("\$8.00",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tax",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary)),
              Text("\$0.00",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary)),
              Text("\$208",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

class myShimmerForm extends StatelessWidget {
  const myShimmerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ShimmerContainer(
              width: double.infinity,
              height: 80,
            ),
            SizedBox(
              height: 20,
            )
          ],
        );
      },
    ));
  }
}

class myForm extends StatelessWidget {
  const myForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CartTile(
                  imageUrl: "lib/assets/images/Rectangle 9.png",
                  size: "M",
                  color: "black",
                  price: 148,
                  title: "Men's Harrington Jacket"),
              SizedBox(
                height: 20,
              )
            ],
          );
        },
      ),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //     CartTile(
      //         imageUrl: "lib/assets/images/Rectangle 9.png",
      //         size: "M",
      //         color: "black",
      //         price: 148,
      //         title: "Men's Harrington Jacket"),
      //     SizedBox(
      //       height: 20,
      //     ),
      //     CartTile(
      //         imageUrl: "lib/assets/images/Rectangle 9.png",
      //         size: "M",
      //         color: "black",
      //         price: 148,
      //         title: "Men's Harrington Jacket"),
      //     SizedBox(
      //       height: 20,
      //     ),
      //     CartTile(
      //         imageUrl: "lib/assets/images/Rectangle 9.png",
      //         size: "M",
      //         color: "black",
      //         price: 148,
      //         title: "Men's Harrington Jacket"),
      //   ],
      // ),
    );
  }
}

class CartTile extends StatelessWidget {
  final String title;
  final String? size;
  final String? color;
  final double price;
  final String imageUrl;

  const CartTile({
    super.key,
    required this.title,
    this.size,
    this.color,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 80,
        color: Theme.of(context).colorScheme.secondary,
        // padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 51,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 12),
                        ),
                        Text(
                          "\$$price",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "Size - ",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary),
                              ),
                              Text(
                                size!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "Color - ",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary),
                              ),
                              Text(
                                color!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 24,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add),
                                style: ButtonStyle(
                                  alignment: Alignment.center,
                                  backgroundColor:
                                      MaterialStateColor.resolveWith((states) =>
                                          Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero),
                                  iconSize: MaterialStateProperty.all(20),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("${0}"),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove),
                                style: ButtonStyle(
                                  alignment: Alignment.center,
                                  backgroundColor:
                                      MaterialStateColor.resolveWith((states) =>
                                          Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero),
                                  iconSize: MaterialStateProperty.all(20),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
