import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'button.dart';
import '../pages/products/productDetail.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductDetail())),
      child: SizedBox(
        // width: 100,
        // height: 200,
        child: Stack(
          alignment: Alignment(1.2, -1.2),
          children: [
            Card(
              color: Theme.of(context).colorScheme.secondary,
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      "lib/assets/images/bag_1.png",
                      fit: BoxFit.fitWidth,
                      width: double.maxFinite,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10 / 4, horizontal: 10),
                    child: Text(
                      "Shopping Bag",
                      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "\$531",
                      style: TextStyle(fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                ],
              ),
            ),
            HeartButton(),
          ],
        ),
      ),
    );
  }
}
