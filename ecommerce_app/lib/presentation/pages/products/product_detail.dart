
import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:ecommerce_app/presentation/controllers/auth.dart';
import 'package:ecommerce_app/presentation/pages/ErrorPage.dart';
import 'package:ecommerce_app/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({
    super.key,
  });


  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  PDetailController pDetailController = PDetailController();

  @override
  Widget build(BuildContext context) {
    print("sss");
    return Material(
      child: FutureBuilder(
        future: pDetailController.retrieveProduct(1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return page(
              shimmer: true,
            );
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data == null) {
                print("herere is the eror");
            // return ErrorPage(
            //   message: "Error loading.",
            // );
            
            return SnackBar(content:Text( "Error loading"));
          } else if (snapshot.hasError) {
                print("herere is the erorrrrr");

            return ErrorPage(
              message: "Error.",
            );
          } else {
            // print(
            //   "the data: ${snapshot.data!.name}");
                print("herere is the eakfjakljflakjror");

            PDetailModel product = snapshot.data!;
            return page(
              product: product,
              shimmer: false,
            );
          }
        },
      ),
    );
  }
}

class page extends StatelessWidget {
  final PDetailModel? product;
  final bool shimmer;
  PDetailController detailController = Get.put(PDetailController());
  final _formKey = GlobalKey<FormState>();
  page({
    super.key,
    this.product,
    required this.shimmer,
  });

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
    return Container(
      color: Theme.of(context).colorScheme.primary,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenWidth > minWidth ? minWidth : screenWidth,
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.primary,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: backButton(),
                actions: [HeartButton()],
              ),
              body: Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // the rest of the page
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // image part >
                          // ImageSection(product: product),
                          shimmer
                              ? ImageSectionShimmer()
                              : ImageSection(product: product!),
                          // end of image part
                          // start of name and choices
                          // NameSection(product: product),
                          const SizedBox(
                            height: 30,
                          ),
                          shimmer
                              ? NameSectionShimmer()
                              : NameSection(product: product!),
                          // choiceContainer(product: product),
                          const SizedBox(
                            height: 30,
                          ),
                          // ReviewWrite(
                          //     formKey: _formKey,
                          //     detailController: detailController),
                          shimmer
                              ? ReviewWriteShimmer()
                              : ReviewWrite(
                                  formKey: _formKey,
                                  detailController: detailController),
                          // end of name and choices
                          // description
                          // DescriptionSection(product: product),
                          const SizedBox(
                            height: 30,
                          ),
                          shimmer
                              ? DescriptionSectionShimmer()
                              : DescriptionSection(product: product!),
                        ],
                      ),
                      side == true
                          ? const SizedBox(
                              width: 0,
                              height: 0,
                            )
                          : shimmer
                              ? myReveiwsShimmer()
                              : myReviews(product: product!),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: GestureDetector(
                onTap: () async {
                  print("line 80 in productDetail.dart");
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
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Add to Bag",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // reviews
          side
              ? SizedBox(
                  width: ((diff - minDiff <= 0))
                      ? 10
                      : (diff - minDiff > maxGap)
                          ? maxGap
                          : diff - minDiff)
              : const SizedBox(
                  width: 0,
                ),
          side
              ? shimmer
                  ? myReveiwsShimmer(
                      side: side,
                    )
                  : myReviews(
                      product: product!,
                      side: side,
                    )
              : const SizedBox(
                  width: 0,
                  height: 0,
                )
        ],
      ),
    );
  }
}

class DescriptionSectionShimmer extends StatelessWidget {
  const DescriptionSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerContainer(
            width: double.infinity,
            height: 300,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
    ;
  }
}

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
    required this.product,
  });

  final PDetailModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                fontSize: 12, color: Theme.of(context).colorScheme.onSecondary),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class ReviewWriteShimmer extends StatelessWidget {
  const ReviewWriteShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   "Write Review",
            //   style: TextStyle(
            //       color: Theme.of(context).colorScheme.onPrimary,
            //       fontSize: 16,
            //       fontWeight: FontWeight.bold),
            // ),
            ShimmerContainer(
              width: double.infinity,
              height: 30,
            ),

            const SizedBox(
              height: 10,
            ),

            ShimmerContainer(
              width: double.infinity,
              height: 200,
            ),
            SizedBox(
              height: 10,
            ),
            ShimmerContainer(
              width: 200,
              height: 40,
            ),
            SizedBox(
              height: 10,
            ),
            ShimmerContainer(
              width: 100,
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}

class ReviewWrite extends StatelessWidget {
  const ReviewWrite({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.detailController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final PDetailController detailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Write Review",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: detailController.reviewController,
              maxLines: 4,
              minLines: 4,
              
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 12),
              decoration: InputDecoration(
                label: Text(
                  "review",
                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
                hintText: "Write you review of this product.",
                hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                fillColor: Theme.of(context).colorScheme.secondary,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onPrimary,
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
                  if (_formKey.currentState!.validate()) {
                    detailController.submitForm();
                    // Get.offNamed("/productDetail");
                  }
                },
                icon: Icon(
                  Icons.send,
                  size: 40,
                  color: Theme.of(context).colorScheme.onPrimary,
                ))
          ],
        ),
      ),
    );
  }
}

class NameSectionShimmer extends StatelessWidget {
  const NameSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerContainer(
      height: 30,
      width: 200,
    );
  }
}

class NameSection extends StatelessWidget {
  const NameSection({
    super.key,
    required this.product,
  });

  final PDetailModel product;

  @override
  Widget build(BuildContext context) {
    return Text(
    
      product == null ? "" : product!.name,
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onPrimary),
    );
  }
}

class ImageSectionShimmer extends StatelessWidget {
  const ImageSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 248,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: [1, 2, 3, 4, 5]
                .map((e) => Row(
                      children: [
                        ShimmerContainer(width: 200),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ))
                .toList()),
      ),
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  final double width;
  final double? height;
  const ShimmerContainer({super.key, required this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.secondary,
      highlightColor: Color.fromRGBO(169, 168, 168, 0.696),
      child: Container(
          width: width,
          height: height,
          color: Theme.of(context)
              .colorScheme
              .primary // Adjust the height as needed
          ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.product,
  });

  final PDetailModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 248,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: product.imageUrls!.map(
          (e) {
            var s;
            try {
              s = Image.network(
                e,
                fit: BoxFit.contain,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  // Return a Container as a fallback if the image fails to load
                  return Container(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 120,
                  );
                },
              );
            } catch (e) {
              print("ljfaljflkajflkj: $e");
              s = Container(
                color: Theme.of(context).colorScheme.secondary,
                width: 120,
              );
            }
            return Row(
              children: [
                s,
                const SizedBox(
                  width: 10,
                )
              ],
            );
          },
        ).toList()),
      ),
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
                      : Icon(Icons.star_border, color: Theme.of(context).colorScheme.secondary,),
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

class myReveiwsShimmer extends StatelessWidget {
  final bool side;
  const myReveiwsShimmer({
    super.key,
    this.side = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(10.0),
      child: side
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: reColumns(
                context,
              ),
            )
          : reColumns(context),
    );
  }

  Column reColumns(BuildContext context) {
    double commentsWidth = 350;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerContainer(
          width: 200,
          height: 30,
        ),
        SizedBox(
          height: 10,
        ),
        ShimmerContainer(
          width: 300,
          height: 40,
        ),
        SizedBox(
          height: 10,
        ),
        ShimmerContainer(
          width: 220,
          height: 25,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          // height: MediaQuery.of(context).size.height,
          width: commentsWidth,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
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
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100)),
                                clipBehavior: Clip.hardEdge,
                                child: CircleAvatar(
                                  child: ShimmerContainer(
                                    width: commentsWidth,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ShimmerContainer(width: 100),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              Icon(
                                Icons.star,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              Icon(
                                Icons.star,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              Icon(
                                Icons.star,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              Icon(
                                Icons.star,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ShimmerContainer(
                        width: double.infinity,
                        height: 100,
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
