import 'package:flutter/material.dart';

import '../../../widgets/item_card.dart';

class SelectedCategoryPage extends StatelessWidget {
  const SelectedCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 25),
            child: Ink(
                decoration: ShapeDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: CircleBorder()),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: ImageIcon(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    AssetImage(
                                      "lib/assets/images/arrowleft2.png",
                                    ),
                                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 5),
            child: Text(
              "Hoodies",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                  itemCount: 50,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (MediaQuery.of(context).size.width * 0.009).floor(),
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCard()),
            ),
          ),
        ],
      ),
    );
  }
}
