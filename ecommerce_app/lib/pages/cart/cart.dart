import 'package:ecommerce_app/widgets/button.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: Container(
          width: 800,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).colorScheme.tertiary),
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(16),
                child: Center(
                    heightFactor: 1,
                    child: Text("Checkout",
                        style: TextStyle(color: Colors.white, fontSize: 16)))),
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
                              Container(
                                alignment: Alignment.topLeft,
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: IconButton(
                                  icon: ImageIcon(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    AssetImage(
                                        "lib/assets/images/arrowleft2.png"),
                                    size: 40, // Adjust the size as needed
                                  ),
                                  onPressed: () => print("back"),
                                ),
                              ),
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
                        Text(
                          "Remove All",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CartTile(
                                  imageUrl: "lib/assets/images/Rectangle 9.png",
                                  size: "M",
                                  color: "black",
                                  price: 148,
                                  title: "Men's Harrington Jacket"),
                              SizedBox(
                                height: 20,
                              ),
                              CartTile(
                                  imageUrl: "lib/assets/images/Rectangle 9.png",
                                  size: "M",
                                  color: "black",
                                  price: 148,
                                  title: "Men's Harrington Jacket"),
                              SizedBox(
                                height: 20,
                              ),
                              CartTile(
                                  imageUrl: "lib/assets/images/Rectangle 9.png",
                                  size: "M",
                                  color: "black",
                                  price: 148,
                                  title: "Men's Harrington Jacket"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 120,
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Subtotal",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary)),
                                  Text("\$200",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Shipping Cost",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary)),
                                  Text("\$8.00",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Tax",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary)),
                                  Text("\$0.00",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary)),
                                  Text("\$208",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
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
