import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';
import 'button.dart';

class ProductTile extends StatelessWidget {
 final Product product;

 ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        // width: 100,
        // height: 200,
        constraints: BoxConstraints(maxHeight: 60),
        child: Stack(
          alignment: Alignment(1.2, -1.2),
          children: [
            Card(
              color: Theme.of(context).colorScheme.secondary,
              elevation: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                        'https://via.placeholder.com/150',
                        width: double.maxFinite,
                        fit: BoxFit.fitHeight, // Cover the available space
                      ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10 / 4, horizontal: 10),
                        child: Text(
                          product.name,
                          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "\$${product.price}",
                      style: TextStyle(fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                    ],
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

