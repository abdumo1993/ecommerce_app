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
    return Container(
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
                      color: Color(0xF4F4F4).withOpacity(1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      icon: ImageIcon(
                        AssetImage("lib/assets/images/arrowleft2.png"),
                        size: 40, // Adjust the size as needed
                      ),
                      onPressed: () => print("back"),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xF4F4F4).withOpacity(1),
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
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "\$145",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0x8E6CEF).withOpacity(1)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ChoiceButton(
                        values: ["S", "M", "L", "XL", "2XL"],
                        representations: [
                          Text("S"),
                          Text("Mi"),
                          Text("L"),
                          Text("XL"),
                          Text("2XL"),
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
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.orange,
                            ),
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red,
                            ),
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.yellow,
                            ),
                          ),
                        ],
                        choices: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Orange"),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Black"),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Red"),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Yellow"),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
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
                            color: Color(0x272727).withOpacity(0.5)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Reviews",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "4.5 Ratings",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "213 Reviews",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0x272727).withOpacity(0.5)),
                      ),
                      // list builder with tile for reviews goes here.
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuantityButton extends StatefulWidget {
  const QuantityButton({super.key});

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6).copyWith(right: 20, left: 20),
      decoration: BoxDecoration(
          color: Color(0xF4F4F4).withOpacity(1),
          borderRadius: BorderRadius.circular(100)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Quantity", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          Row(
            children: [
              ContinueButton(
                  onPress: () {
                    setState(() {
                      _quantity += 1;
                    });
                  },
                  child: Icon(Icons.add)),
              SizedBox(
                width: 10,
              ),
              Text("$_quantity"),
              SizedBox(
                width: 10,
              ),
              ContinueButton(
                  padding: 20,
                  onPress: () {
                    setState(() {
                      if (_quantity > 0) _quantity -= 1;
                    });
                  },
                  child: Icon(Icons.remove)),
            ],
          ),
        ],
      ),
    );
  }
}
