import 'package:ecommerce_app/presentation/pages/home/components/categories_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'selected_category_page.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoriesPage())),
                  child: Text(
                    "See All",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w500),
                  )),
            ],
          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 100,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectedCategoryPage())),
                        icon: Image.asset(
                          "lib/assets/images/bag_1.png",
                          fit: BoxFit.contain,
                          scale: 5,
                        ),
                      ),
                      GestureDetector(
                          onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectedCategoryPage())),
                          child: Text(
                            "Bags",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ))
                    ],
                  );
                }),
          ),
        ),
      ],
    );
  }
}
