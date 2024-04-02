import 'package:ecommerce_app/presentation/controllers/search_text_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../../search/search_page.dart';

class SearchingBar extends StatelessWidget {
  SearchingBar({super.key});
    @override
  Widget build(BuildContext context) {
  final searchTextController = Get.put(SearchTextController());
    return 
    // Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20),
    //   child: SizedBox(
    //       child:
           SearchBar(
            controller: searchTextController.searchController,
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
            constraints: BoxConstraints(maxHeight: 40,maxWidth: MediaQuery.of(context).size.width*0.5, minHeight: 40),
            textStyle: MaterialStatePropertyAll(TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
            backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary) ,
            onSubmitted: (Value) => searchTextController.validateSearchWord(),
            padding: const MaterialStatePropertyAll(
              EdgeInsets.only(left: 30,right: 10),
            ),
            leading: Icon(Icons.search_outlined),
            hintText: "Search",
            elevation:const MaterialStatePropertyAll(2),
    );
  }
}
