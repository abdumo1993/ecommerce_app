import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'categories.dart';
import '../../../widgets/item_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Categories(),
        
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (MediaQuery.of(context).size.width * 0.009).floor(),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.75,
              ), 
              itemBuilder: (context, index) => ItemCard()
            ),
          ),
        ),
      ],
    );
  }
}
