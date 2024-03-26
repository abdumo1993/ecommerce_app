import 'package:ecommerce_app/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../widgets/item_card.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key, required this.keyWord});
  final String keyWord;

  @override
  Widget build(BuildContext context) {
    final List<Widget> filter = [
      IconButton(
          onPressed: () {},
          icon:
              Icon(Icons.clear, color: Theme.of(context).colorScheme.onPrimary))
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Ink(
                    decoration: ShapeDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        shape: CircleBorder()),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: ImageIcon(
                        color: Theme.of(context).colorScheme.onSecondary,
                        AssetImage("lib/assets/images/arrowleft2.png"),
                      ),
                    )),
              ),
              SearchBar(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                constraints: BoxConstraints(maxHeight: 40,maxWidth: MediaQuery.of(context).size.width*0.7),
                textStyle: MaterialStatePropertyAll(
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Theme.of(context).colorScheme.secondary),
                onSubmitted: (value) => (),
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.only(left: 30, right: 10),
                ),
                leading: Icon(
                  Icons.search_outlined,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                hintText: "$keyWord",
                elevation: const MaterialStatePropertyAll(2),
                trailing: filter,
              ),
            ],
          ),
          SizedBox(height: 20,),
          SizedBox(
            height: 40,
            child: ListView(
              itemExtent: 150,
              scrollDirection: Axis.horizontal,
              children: [
                FilterChip(
                  label: Icon(Icons.filter_alt),
                  onSelected: (value) {},
                  selected: true,
                  selectedColor: Theme.of(context).colorScheme.tertiary,
                ),
                ChoiceButton(
                  values: ["S", "M", "L", "XL"],
                  representations: [
                    Text("S", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                    Text("Me", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                    Text("L", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                    Text("XL", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                  ],
                  choices: [
                    Text("Price: Lowest - Highest"),
                    Text("Price: Highest - Lowest"),
                    Text("Newest"),
                    Text("Recommended"),
                  ],
                  title: "Sort by",
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 5, top: 10),
            child: Text(
              "53 results found",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary),
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
