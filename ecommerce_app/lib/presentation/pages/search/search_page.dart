import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../controllers/search_page_controller.dart';
import '../../widgets/button.dart';
import '../../widgets/item_card.dart';



class SearchPage extends StatelessWidget {
//  final SearchPageController controller = Get.find<SearchPageController>();
  final String? keyWord = Get.arguments['keyword'];
  SearchPage({super.key});
  final SearchPageController controller = Get.put(SearchPageController());
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
              itemExtent: 200,
              scrollDirection: Axis.horizontal,
              children: [
                Obx(() => FilterChip(
                    label: Row( mainAxisSize: MainAxisSize.min,
                      children: [Text("${controller.selectedFilters.length}"),
                        Icon(Icons.filter_alt),
                      ],
                    ),
                    onSelected: (value) { _showFilterBottomSheet(context);},
                    selected: controller.selectedFilters.length>0,
                    // selectedColor:  Theme.of(context).colorScheme.tertiary ,
                    color: MaterialStatePropertyAll(Theme.of(context).colorScheme.tertiary),
                  ),
                ),
                ChoiceButton(
                  values: ["Hi-Low", "Low-Hi", "New", "Recommend"],
                  representations: [
                    Text("Hi-Low", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                    Text("Low-Hi", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                    Text("New", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                    Text("Recommend", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
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

 void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Obx(() => Container(
          color: Theme.of(context).colorScheme.primary,
          child: Column(
                children: [
                  ListTile(
                   title: Text('Filter 1',style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,),),
                   trailing: IconButton(
                      icon: Icon(controller.selectedFilters.contains('Filter 1') ? Icons.check_box : Icons.check_box_outline_blank, 
                    color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      onPressed: () {
                        if (controller.selectedFilters.contains('Filter 1')) {
                          controller.removeFilter('Filter 1');
                        } else {
                          controller.addFilter('Filter 1');
                        }
                      },
                   ),
                  ),
                  ListTile(
                   title: Text('Filter 2',style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,),),
                   trailing: IconButton(
                      icon: Icon(controller.selectedFilters.contains('Filter 2') ? Icons.check_box : Icons.check_box_outline_blank, 
                    color: Theme.of(context).colorScheme.onPrimary,),
                      onPressed: () {
                        if (controller.selectedFilters.contains('Filter 2')) {
                          controller.removeFilter('Filter 2');
                        } else {
                          controller.addFilter('Filter 2');
                        }
                      },
                   ),
                  ),
                  ListTile(
                   title: Text('Filter 3',style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,),),
                   trailing: IconButton(
                      icon: Icon(controller.selectedFilters.contains('Filter 3') ? Icons.check_box : Icons.check_box_outline_blank, 
                    color: Theme.of(context).colorScheme.onPrimary,),
                      onPressed: () {
                        if (controller.selectedFilters.contains('Filter 3')) {
                          controller.removeFilter('Filter 3');
                        } else {
                          controller.addFilter('Filter 3');
                        }
                      },
                   ),
                  ),
                ],
              ),
        ));
      },
    );
 }
}
