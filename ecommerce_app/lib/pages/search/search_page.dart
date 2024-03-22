import 'package:ecommerce_app/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../widgets/item_card.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key, required this.keyWord});
  final String keyWord ;
  static List<Widget> filter =[IconButton(onPressed: (){}, icon: const Icon(Icons.clear))];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Ink(decoration:  ShapeDecoration(color: Colors.grey.shade200,shape: CircleBorder()),child: IconButton(onPressed:() => Navigator.pop(context),icon: Icon(Icons.arrow_back),)),
        toolbarHeight: 70,
        title:  SearchBar(
         onSubmitted: (value) => (),
            padding: const MaterialStatePropertyAll(
              EdgeInsets.only(left: 30,right: 10),
            ),
            leading: const Icon(Icons.search_outlined),
            hintText: "$keyWord",
            elevation:const MaterialStatePropertyAll(2),
            trailing: filter,

      ),),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            child: ListView(itemExtent: 150,scrollDirection: Axis.horizontal,children: [
              FilterChip(label: Icon(Icons.filter_alt), onSelected: (value) {},selected: true,selectedColor: Color(0xFF8E6CEF),),
              const ChoiceButton(
                        values: ["S", "M", "L", "XL", "2XL"],
                        representations: [
                          Text("S"),
                          Text("Me"),
                          Text("L"),
                          Text("XL"),
                        ],
                        choices: [
                          Text("Price: Lowest - Highest"),
                          Text("Price: Highest - Lowest"),
                          Text("Newest"),
                          Text("Recommended"),
                        ],
                        title: "Sort by",
                        ),
                        
            ],),
          ),
          
          const Padding(padding: EdgeInsets.only(left: 20,bottom: 5,top: 10), child: Text("53 results found",textAlign:TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold),),),
          Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              itemCount: 50,
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
      ),
    );
  }
}