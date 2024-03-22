import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              Text("Categories"),
              GestureDetector(onTap: (){}, child: Text("See All")),
            ],
          ),
        ),
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
                        onPressed: () {},
                        icon: Image.asset(
                          "lib/assets/images/bag_1.png",
                          fit: BoxFit.contain,scale: 5,
                        ),
                      ),
                      GestureDetector(onTap: () {} ,child: Text("Bags"))
                    ],
                  );
                }),
          ),
        ),
      ],
    );
  }
}
