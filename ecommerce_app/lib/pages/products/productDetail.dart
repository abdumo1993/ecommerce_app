import 'package:ecommerce_app/widgets/button.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return myScaffold();
  }
}

class myScaffold extends StatelessWidget {
  const myScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool side = false;
    final diff = (() {
      var screenWidth = MediaQuery.of(context).size.width;
      var diff = screenWidth - 500;
      if (screenWidth > 500) {
        if (diff > 280) {
          side = true;
        } else
          side = false;
      } else {
        side = false;
      }
      return diff;
    })();
    return Container(
      color: Theme.of(context).colorScheme.primary,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 500,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).colorScheme.tertiary),
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$148",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Add to Bag",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                body: Container(
                  alignment: Alignment.topRight,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
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
                                      "lib/assets/images/arrowleft2.png",
                                    ),
                                    size: 40, // Adjust the size as needed
                                  ),
                                  onPressed: () => print("back"),
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: HeartButton(),
                              ),
                            ],
                          ),
                        ),
                        // the rest of the page
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // image part >
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 248,
                              width: double.infinity,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "lib/assets/images/Rectangle 9.png",
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      "lib/assets/images/Rectangle 10.png",
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      "lib/assets/images/Rectangle 11.png",
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      "lib/assets/images/Rectangle 10.png",
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // end of image part
                            // start of name and choices
                            Container(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Men's Harrington Jacket",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "\$145",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  ChoiceButton(
                                    values: ["S", "M", "L", "XL", "2XL"],
                                    representations: [
                                      Text(
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                          "S"),
                                      Text(
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                          "Mi"),
                                      Text(
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                          "L"),
                                      Text(
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                          "XL"),
                                      Text(
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                          "2XL"),
                                    ],
                                    choices: [
                                      Text("S"),
                                      Text("Me"),
                                      Text("L"),
                                      Text("XL"),
                                      Text("2XL"),
                                    ],
                                    title: "Size",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ChoiceButton(
                                    values: [
                                      Colors.orange,
                                      Colors.black,
                                      Colors.red,
                                      Colors.yellow
                                    ],
                                    representations: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.orange,
                                        ),
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.black,
                                        ),
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.red,
                                        ),
                                      ),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.yellow,
                                        ),
                                      ),
                                    ],
                                    choices: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Orange"),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Black"),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Red"),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Yellow"),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.yellow,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                    title: "Color",
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  QuantityButton(),
                                ],
                              ),
                            ),
                            // end of name and choices
                            // description
                            Container(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        side
                            ? Text(
                                "side",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              )
                            : myReviews(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            side
                ? SizedBox(
                    width: ((diff - 280 <= 0))
                        ? 10
                        : (diff - 280 > 150)
                            ? 150
                            : diff - 280)
                : SizedBox(
                    width: 0,
                  ),
            side
                ? myReviews(
                    side: side,
                  )
                : Text(
                    "side",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
          ],
        ),
      ),
    );
  }
}

class myReviews extends StatelessWidget {
  final bool side;
  const myReviews({
    this.side = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(20.0),
      child: side
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: reColumns(context),
            )
          : reColumns(context),
    );
  }

  Column reColumns(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reviews",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        Text(
          "4.5 Ratings",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        Text(
          "213 Reviews",
          style: TextStyle(
              fontSize: 12, color: Theme.of(context).colorScheme.onSecondary),
        ),

        Container(
          // height: MediaQuery.of(context).size.height,
          width: 350,
          child: ListView.builder(
            itemCount: mokeReviews.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                child: Text(mokeReviews[index]["name"]![0]),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                mokeReviews[index]["name"]!,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Text(
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                        "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
        // Column(
        //   children: mokeReviews
        //       .map((e) => Card(
        //         color: Theme.of(context).colorScheme.secondary,
        //         child: Container(
        //               width: 200,
        //               child: Column(
        //                 children: [
        //                   Text(
        //                     e["name"]!,
        //                     style: TextStyle(color: Colors.red),
        //                   ),
        //                   Text(
        //                     "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        //                   ),
        //                   Row(
        //                     mainAxisSize: MainAxisSize.min,
        //                     children: [
        //                       Icon(
        //                         Icons.star,
        //                         color: Colors.yellow,
        //                       ),
        //                       Icon(
        //                         Icons.star,
        //                         color: Colors.yellow,
        //                       ),
        //                       Icon(
        //                         Icons.star,
        //                         color: Colors.yellow,
        //                       ),
        //                       Icon(
        //                         Icons.star,
        //                         color: Colors.yellow,
        //                       ),
        //                       Icon(
        //                         Icons.star,
        //                         color: Colors.yellow,
        //                       ),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //             ),
        //       ))
        //       .toList(),
        // ),
      ],
    );
  }
}

var mokeReviews = [
  {
    "name": "Anonymous",
    "comment":
        "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
  },
  {
    "name": "User99",
    "comment":
        "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
  },
  {
    "name": "John",
    "comment":
        "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
  },
  {
    "name": "FirstUser",
    "comment":
        "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
  },
];
