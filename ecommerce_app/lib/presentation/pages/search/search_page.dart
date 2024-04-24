import 'package:ecommerce_app/presentation/pages/search/categoryfilter.dart';
import 'package:ecommerce_app/presentation/pages/search/search_results.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/data_sources/search_product_data_source.dart';
import '../../../data/data_sources/search_products_data_source_impl.dart';
import '../../../data/repositories/search_product_repository_impl.dart';
import '../../../domain/repositories/search_product_repository.dart';
import '../../../domain/usecases/search_product_usecase.dart';
import '../../../domain/usecases/search_product_usecase_impl.dart';
import '../../controllers/search_page_controller.dart';
import '../../widgets/button.dart';



class SearchPage extends StatelessWidget {
  final String? keyWord = Get.arguments['keyword'];
  SearchPage({super.key});
   
 @override
 Widget build(BuildContext context) {


final SearchProductsDataSource searchProductsDataSource = SearchProductsDataSourceImpl();
 final SearchProductsRepository searchProductsRepository = SearchProductsRepositoryImpl(searchRepo: searchProductsDataSource);
final SearchProductsUseCase searchProductsUseCase = SearchProductsUseCaseImpl(searchRepo: searchProductsRepository);
  final SearchPageController controller = Get.put(SearchPageController(searchProductsUseCase));

  final List<Widget> filter = [
      IconButton(
          onPressed: () {controller.searchWordController.clear();},
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
                      onPressed: () => {controller.searchWordController.clear(),Navigator.pop(context),},
                      icon: ImageIcon(
                        color: Theme.of(context).colorScheme.onSecondary,
                        AssetImage("lib/assets/images/arrowleft2.png"),
                      ),
                    )),
              ),
              SearchBar(
                controller: controller.searchWordController,
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                constraints: BoxConstraints(maxHeight: 40,maxWidth: MediaQuery.of(context).size.width*0.7),
                textStyle: MaterialStatePropertyAll(
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Theme.of(context).colorScheme.secondary),
                onSubmitted: (value) => ({
                  // controller.searchWord.value =value,
                  controller.validateSearchWord(),
                  if(controller.valid){controller.refresh()},
                  }),
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.only(left: 30, right: 10),
                ),
                leading: Icon(
                  Icons.search_outlined,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                // hintText: "$keyWord",
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
                    values: ["None","Low-Hi", "Hi-Low",],
                    representations: [
                      Text("None", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                      Text("Low-Him", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                      Text("Hi-Low", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                    ],
                    choices: [
                      GestureDetector(onTap: () => controller.setSortType("NONE"), child: Text("None")),
                      GestureDetector(onTap: () => controller.setSortType("PRICE_ASCENDING"), child: Text("Price: Lowest - Highest")),
                      GestureDetector(onTap: () => controller.setSortType("PRICE_DESCENDING"), child: Text("Price: Highest - Lowest"),),
                    ],
                    title: "Sort by",
                  ),
              ],
            ),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.only(left: 20, bottom: 5, top: 10),
              child: Text(
                "${controller.total.value} ${controller.total.value==1?'result':'results'} found",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ),
          Expanded(child: SearchResult())
        ],
      ),
    );
 }

 void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor:Theme.of(context).colorScheme.primary,
      context: context,
      builder: (context) {
        return Container(
          color: Theme.of(context).colorScheme.primary,
          child: SingleChildScrollView(
            child: categoryfilter(),
        ));
      },
    );
 }
}
