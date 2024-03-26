import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'selected_category_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
               padding: EdgeInsets.only(left: 20,top: 25),
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
                                    //size: 40, // Adjust the size as needed
                                  ),
                )),
             ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 5),
              child: Text(
                "Shop by Categories",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 15,),
            CategoryBtn(),
            CategoryBtn(),
            CategoryBtn(),
            CategoryBtn(),
          ],
        ));
  }
}

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextButton(
        style: ButtonStyle(
            padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
            backgroundColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.secondary),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)))),
        onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectedCategoryPage())),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("lib/assets/images/Rectangle 9.png"),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Hoodies",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
