import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:ecommerce_app/presentation/controllers/auth.dart';
import 'package:ecommerce_app/presentation/pages/loadingpage.dart';
import 'package:ecommerce_app/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  PDetailModel? product;
  PDetailController pDetailController = PDetailController();
  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    // pDetailController.retrieveProduct(Get.arguments["id"]).then((p) {
    //   if (p != null) {
    //     setState(() {
    //       product = p;
    //     });
    //   }
    // });

   
      fetch();
   
    super.initState();
  }

  void fetch() async {  
    try {
      var a = await pDetailController.retrieveProduct("1");
      print("a: $a");
      setState(() {
        
      product = a;
      });
    } catch (e) {
      // Handle the error, e.g., show a snackbar or a dialog
      Get.snackbar("Error", "Failed to load product details");
    }
  }

  @override 
  Widget build(BuildContext context) {
    return myScaffold(product: product);
  }
}

class myScaffold extends StatelessWidget {
  DioClient dio = DioClient();
  final PDetailModel? product;
  myScaffold({super.key, required this.product});
  PDetailController detailController = Get.put(PDetailController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool side = false;
    var screenWidth = MediaQuery.of(context).size.width;
    double minWidth = 500;
    double minDiff = 390;
    double maxGap = 150;
    final diff = (() {
      var diff = screenWidth - minWidth;
      if (screenWidth > minWidth) {
        if (diff > minDiff) {
          side = true;
        } else
          side = false;
      } else {
        side = false;
      }
      return diff;
    })();
    return Material(
      child: Container(
          color: Theme.of(context).colorScheme.primary,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWidth > minWidth ? minWidth : screenWidth,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  bottomNavigationBar: GestureDetector(
                    onTap: () async {
                      print("line 80 in productDetail.dart");
                      await dio.dio.get("/anything");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(context).colorScheme.tertiary),
                      margin: EdgeInsets.all(20.0),
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product == null ? "" : "\$${product!.price}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Add to Bag",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
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
                                const backButton(),
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
                                      children: product != null
                                          ? product!.imageUrls!.map(
                                              (e) {
                                                return Row(
                                                  children: [
                                                    Image.asset(
                                                      e,
                                                      fit: BoxFit.contain,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    )
                                                  ],
                                                );
                                              },
                                            ).toList()
                                          : [1, 2, 3, 4, 5]
                                              .map((e) => Row(
                                                children: [
                                                  Container(
                                                        color: Theme.of(context).colorScheme.secondary,
                                                        width: 120,
                                                      ),
                                                      const SizedBox(
                                                      width: 10,
                                                    )
                                                ],
                                              ))
                                              .toList()),
                                ),
                              ),
                              // end of image part
                              // start of name and choices
                              Text(
                                product == null ? "" : product!.name,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                              // choiceContainer(product: product),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Write Review",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller:
                                            detailController.reviewController,
                                        maxLines: 4,
                                        minLines: 4,
                                        decoration: InputDecoration(
                                          label: Text(
                                            "review",
                                          ),
                                          hintText:
                                              "Write you review of this product.",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                      ratingWidget(
                                        detailController: detailController,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              detailController.submitForm();
                                              Get.offNamed("/productDetail");
                                            }
                                          },
                                          icon: Icon(
                                            Icons.send,
                                            size: 40,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ))
                                    ],
                                  ),
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
                                      product != null
                                          ? product!.description == null
                                              ? "No Description"
                                              : product!.description!
                                          : "",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          product != null
                              ? side == true
                                  ? const SizedBox(
                                      width: 0,
                                      height: 0,
                                    )
                                  : myReviews(
                                      product: product!,
                                    )
                              : SizedBox(
                                  width: 0,
                                  height: 0,
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              product != null
                  ? side
                      ? SizedBox(
                          width: ((diff - minDiff <= 0))
                              ? 10
                              : (diff - minDiff > maxGap)
                                  ? maxGap
                                  : diff - minDiff)
                      : const SizedBox(
                          width: 0,
                        )
                  : SizedBox(
                      width: 0,
                      height: 0,
                    ),
              product != null
                  ? side
                      ? myReviews(
                          side: side,
                          product: product!,
                        )
                      : const SizedBox(
                          width: 0,
                          height: 0,
                        )
                  : SizedBox(
                      width: 0,
                      height: 0,
                    )
            ],
          )),
    );
  }
}

class ratingWidget extends StatelessWidget {
  const ratingWidget({
    super.key,
    required this.detailController,
  });

  final PDetailController detailController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => (Row(
          mainAxisSize: MainAxisSize.min,
          children: [1, 2, 3, 4, 5]
              .map(
                (e) => GestureDetector(
                  onTap: () => detailController.changeRating(e),
                  child: (detailController.rating.value != null &&
                          (detailController.rating.value! >= e))
                      ? Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )
                      : Icon(Icons.star_border),
                ),
              )
              .toList(),
        )));
  }
}

class choiceContainer extends StatelessWidget {
  const choiceContainer({
    super.key,
    required this.product,
  });

  final PDetailModel product;

  @override
  Widget build(BuildContext context) {
    print(product);
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.tertiary),
          ),
          const SizedBox(
            height: 25,
          ),
          ChoiceButton(
            values: ["S", "M", "L", "XL", "2XL"],
            representations: [
              Text(
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  "S"),
              Text(
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  "Mi"),
              Text(
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  "L"),
              Text(
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  "XL"),
              Text(
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
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
          const SizedBox(
            height: 10,
          ),
          ChoiceButton(
            values: [Colors.orange, Colors.black, Colors.red, Colors.yellow],
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
          const SizedBox(
            height: 10,
          ),
          QuantityButton(),
        ],
      ),
    );
  }
}

class myReviews extends StatelessWidget {
  final bool side;
  final PDetailModel product;
  const myReviews({
    this.side = false,
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(10.0),
      child: side
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: reColumns(context, product),
            )
          : reColumns(context, product),
    );
  }

  Column reColumns(BuildContext context, PDetailModel product) {
    double commentsWidth = 350;

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
          "${product.reviews!["rating"]} Ratings",
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
          width: commentsWidth,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: product.reviews!["reviews"].length,
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
                                child: Text(product.reviews!["reviews"][index]
                                    ["name"]![0]),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                product.reviews!["reviews"][index]["name"]!,
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
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        product.reviews!["reviews"][index]["comment"],
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
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
