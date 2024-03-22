import 'package:flutter/material.dart';

import '../../search/search_page.dart';

class SearchingBar extends StatelessWidget {
  SearchingBar({super.key});
    @override
  Widget build(BuildContext context) {
    return 
    // Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20),
    //   child: SizedBox(
    //       child:
           SearchBar(
            onSubmitted: (value) => Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchPage(keyWord: value,))),
            padding: const MaterialStatePropertyAll(
              EdgeInsets.only(left: 30,right: 10),
            ),
            leading: const Icon(Icons.search_outlined),
            hintText: "Search",
            elevation:const MaterialStatePropertyAll(2),
    );
  }
}