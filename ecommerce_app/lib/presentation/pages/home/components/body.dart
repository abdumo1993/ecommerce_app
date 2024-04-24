import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/presentation/pages/home/components/home_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../products.dart';
// import '../search.dart';
import 'categories.dart';
import '../../../widgets/item_card.dart';
import 'searching_bar.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  //  onPressed: () => Get.toNamed("/settings"),
                  icon: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.onPrimary,
                  )),
              SearchingBar(),
              IconButton(
                onPressed: () {
                  Get.find<ThemeController>().onItemTapped();
                },
                icon: Icon(Icons.dark_mode_outlined),
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              IconButton(
                onPressed: () {
                  Get.toNamed("/cart");
                },
                // => Get.toNamed("/checkout"),
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ProductListScreen())),
                icon: Icon(Icons.shopping_bag_outlined),
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              IconButton(
                onPressed: () {
                  print("here?");
                  Get.toNamed("/orders");


                },
                icon: Icon(Icons.history),
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Categories(),
        Expanded(child: HomeResult()),
      ],
    );
  }
}
