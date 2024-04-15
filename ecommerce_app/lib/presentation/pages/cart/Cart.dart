import 'package:ecommerce_app/domain/entities/cart.dart';
import 'package:ecommerce_app/presentation/controllers/auth.dart';
import 'package:ecommerce_app/presentation/controllers/cart.dart';
import 'package:ecommerce_app/presentation/controllers/checkout.dart';
import 'package:ecommerce_app/presentation/pages/ErrorPage.dart';
import 'package:ecommerce_app/presentation/pages/cart/emptyCart.dart';
import 'package:ecommerce_app/presentation/pages/products/product_detail.dart';
import 'package:ecommerce_app/presentation/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Cart_cart extends StatelessWidget {
  const Cart_cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.put(CartController());
    Get.put(CheckoutController());
    return FutureBuilder(
      future: controller.fetchItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print("we are waiting");
          return CartView(shimmer: true);
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data == null &&
            !snapshot.hasError) {
          return ErrorPage(
              message: "Couldn't fetch cart items. try again later.");
        } else if (snapshot.hasError) {
          return EmptyCart();
        } else {
          print(snapshot.data);
          var returnedData = snapshot.data!;
          print("items empty: ${snapshot.data![2]}");
          if (returnedData[2].isEmpty) {
            return EmptyCart();
          } else {
            print("returned: $returnedData, snapshot: $snapshot");
            return CartView(returnees: returnedData, shimmer: false);
          }
        }
      },
    );
  }
}

class CartView extends StatelessWidget {
  final bool shimmer;
  final List? returnees;
  const CartView({super.key, this.shimmer = false, this.returnees});

  @override
  Widget build(BuildContext context) {
    print("returennes: $returnees");
    var cartID;
    var totalPrice;
    var itemss;
    if (returnees != null) {
      [cartID, totalPrice, itemss] = returnees!;
      print("CartID: $cartID, totalPrice: $totalPrice, itemss : $itemss");
    }

    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: Container(
          width: 800,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: GestureDetector(
              onTap: () {
                if (returnees != null) {
                  if (itemss != null) {
                    Get.find<CheckoutController>().checkout(itemss!);
                  }
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
                            Get.find<CartController>().removeAll();
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
                        shimmer ? myShimmerForm() : myForm(items: itemss!),
                        SizedBox(
                          height: 120,
                        ),
                        shimmer
                            ? myShimmerTotal()
                            : myTotal(
                                total: totalPrice,
                              ),
                        SizedBox(
                          height: 100,
                        ),
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
  final num total;
  const myTotal({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: 40,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subtotal",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary)),
              Text("\$$total",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary)),
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
  final List<CartItem?> items;
  const myForm({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    print("items ss : ${items.length}");
    return Obx(() {
      return Form(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: Get.find<CartController>().cItemCount.value,
          itemBuilder: (context, index) {
            var item = items[index]!;
            var product = item.product;
            print("277 : $item, $product");
            return Column(
              children: [
                GestureDetector(
                  onHorizontalDragEnd: (details) {
                    if (details.primaryVelocity == null) {
                    } else if (details.primaryVelocity! > 0.0 ||
                        details.primaryVelocity! < 0) {
                      Get.find<CartController>().removeFromCart(item.toJson());
                      Get.offAndToNamed("/cart");
                    }
                  },
                  child: CartTile(
                      item: item,
                      imageUrl:
                          product.images!.map((e) => e.toString()).toList(),
                      price: product.price,
                      count: product.count,
                      title: product.name),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            );
          },
        ),
      );
    });
    // return Form(
    //   child: ListView.builder(
    //     shrinkWrap: true,
    //     itemCount: items.length,
    //     itemBuilder: (context, index) {
    //       var item = items[index]!;
    //       var product = item.product;
    //       print("277 : $item, $product");
    //       return Column(
    //         children: [
    //           GestureDetector(
    //             onHorizontalDragEnd: (details) {
    //               if (details.primaryVelocity == null) {
    //               } else if (details.primaryVelocity! > 0.0 ||
    //                   details.primaryVelocity! < 0) {
    //                 Get.find<CartController>().removeFromCart(item.toJson());
    //                 Get.snackbar("Removed",
    //                     "Product ${product.name} has been removed from your cart.");
    //               }
    //             },
    //             child: CartTile(
    //                 item: item,
    //                 imageUrl: product.images!.map((e) => e.toString()).toList(),
    //                 price: product.price,
    //                 count: product.count,
    //                 title: product.name),
    //           ),
    //           SizedBox(
    //             height: 20,
    //           )
    //         ],
    //       );

    //       // Get.find<PDetailController>()
    //       //     .retrieveProduct(items[index]!.productId)
    //       //     .then((value) {
    //       //   return Column(
    //       //     children: [
    //       //       GestureDetector(
    //       //         onHorizontalDragEnd: (details) {
    //       //           if (details.primaryVelocity == null) {
    //       //           } else if (details.primaryVelocity! > 0.0 ||
    //       //               details.primaryVelocity! < 0) {
    //       //             Get.find<CartController>()
    //       //                 .removeFromCart(items[index]!.toJson());
    //       //             Get.snackbar("Removed",
    //       //                 "Product ${value.name} has been removed from your cart.");
    //       //           }
    //       //         },
    //       //         child: CartTile(
    //       //             item: items[index]!,
    //       //             imageUrl:
    //       //                 value!.images!.map((e) => e.toString()).toList(),
    //       //             price: value.price,
    //       //             count: value.count,
    //       //             title: value.name),
    //       //       ),
    //       //       SizedBox(
    //       //         height: 20,
    //       //       )
    //       //     ],
    //       //   );
    //       // });
    //     },
    //   ),
    // );
  }
}

class CartTile extends StatelessWidget {
  final String title;
  final CartItem item;
  final int count;
  final double price;
  final List<String?> imageUrl;

  const CartTile({
    super.key,
    required this.title,
    required this.count,
    required this.price,
    required this.imageUrl,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    print("cat tile: $item, $title, $count, $price, $imageUrl");
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
              child: !imageUrl.isEmpty
                  ? Image.network(
                      imageUrl[0]!,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(
                      width: 32,
                      height: 64,
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
                          height: 24,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (item.quantity <= count) {
                                    Get.find<CartController>()
                                        .updateCartItem(item.toJson());
                                  } else {
                                    Get.snackbar("Invalid",
                                        "Max Quantity for this product has been reached.");
                                  }
                                },
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
                              Text(
                                "${item.quantity}",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                onPressed: () {
                                  if (item.quantity > 1) {
                                    Get.find<CartController>()
                                        .updateCartItem(item.toJson());
                                  } else if (item.quantity <= 1) {
                                    Get.find<CartController>()
                                        .removeFromCart(item.toJson());
                                    Get.snackbar("Removed",
                                        "Product ${title} has been removed from your cart");
                                  } else {
                                    Get.snackbar("Invalid",
                                        "Min Quantity for this product has been reached.");
                                  }
                                },
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
