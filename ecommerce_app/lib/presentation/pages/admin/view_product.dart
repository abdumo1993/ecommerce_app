import 'package:ecommerce_app/core/utils/roles.dart';
import 'package:ecommerce_app/presentation/controllers/admin_table_controller.dart';
import 'package:ecommerce_app/presentation/widgets/roleBasedAccessControlWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../../data/data_sources/search_product_data_source.dart';
import '../../../data/data_sources/search_products_data_source_impl.dart';
import '../../../data/repositories/search_product_repository_impl.dart';
import '../../../domain/repositories/search_product_repository.dart';
import '../../../domain/usecases/search_product_usecase.dart';
import '../../../domain/usecases/search_product_usecase_impl.dart';
import '../../controllers/search_page_controller.dart';
import '../../widgets/button.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../domain/entities/product.dart';


import 'package:ecommerce_app/core/utils/category_enum.dart';
import 'package:ecommerce_app/presentation/controllers/expansion_controller.dart';

import 'edit_product.dart';
class MyProducts extends StatelessWidget {
  const MyProducts({super.key});

  @override
  Widget build(BuildContext context) {


final SearchProductsDataSource searchProductsDataSource = SearchProductsDataSourceImpl();
 final SearchProductsRepository searchProductsRepository = SearchProductsRepositoryImpl(searchRepo: searchProductsDataSource);
final SearchProductsUseCase searchProductsUseCase = SearchProductsUseCaseImpl(searchRepo: searchProductsRepository);
  final AdminTableController controller = Get.put(AdminTableController(searchProductsUseCase));

  final List<Widget> filter = [
      IconButton(
          onPressed: () {controller.searchWordController.clear();},
          icon:
              Icon(Icons.clear, color: Theme.of(context).colorScheme.onPrimary))
    ];
    return AccessControlWidget(
    allowedRole: Roles.ADMIN,
      child: Scaffold(
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
                    // controller.validateSearchWord(),
                    // if(controller.valid){
                      controller.refresh()
                      // },
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
            Expanded(child: Results())
          ],
        ),
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


class categoryfilter extends StatelessWidget {
  const categoryfilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ExpansionController expController = Get.find<ExpansionController>();
    return Obx(
      () => SizedBox(
        height: 800,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Filters",
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  Spacer(),
                  ContinueButton(onPress: (){
                  Get.find<AdminTableController>().refresh();
                  }, child: Text(
                            "Apply",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),padding: 10,)
                ],
              ),
            ),
            
                  Text(
                    "Items per page",
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  SegmentedButton(
                    segments: [
                      ButtonSegment(
                          value: "2",
                          // icon: Icon(Icons.timer_10),
                          label: Text(
                            "2",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          )),
                      ButtonSegment(
                          value: "10",
                          // icon: Icon(Icons.timer_10),
                          label: Text(
                            "10",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          )),
                      ButtonSegment(
                          value: "20",
                          // icon: Icon(Icons.timer_10),
                          label: Text(
                            "20",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          )),
                      ButtonSegment(
                          value: "50",
                          // icon: Icon(Icons.timer_10),
                          label: Text(
                            "50",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          )),
                    ],
                    selected: expController.pageSize,
                    onSelectionChanged: (p0) =>
                        Get.find<ExpansionController>().changeSize(p0),
                    style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.onPrimary),
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.onSecondary),
                        minimumSize: MaterialStatePropertyAll(Size(50, 50))),
                  ),
            ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) => expController
                  .isOpen[panelIndex] = !expController.isOpen[panelIndex],
              children: [
                ExpansionPanel(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  isExpanded: expController.isOpen[0],
                  headerBuilder: (context, bool isExpanded) => Text(
                    "Categories",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  body: SizedBox(
                    height: 200,
                    child: ListView.builder(
                        itemCount: Category.values.length,
                        itemBuilder: (_, index) {
                          return Obx(() => Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      Category.values[index].name,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(
                                        Get.find<AdminTableController>()
                                                .selectedFilters
                                                .contains(
                                                    Category.values[index].name)
                                            ? Icons.check_box
                                            : Icons.check_box_outline_blank,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                      onPressed: () {
                                        if (Get.find<AdminTableController>()
                                            .selectedFilters
                                            .contains(
                                                Category.values[index].name)) {
                                          Get.find<AdminTableController>()
                                              .removeFilter(
                                                  Category.values[index].name);
                                        } else {
                                          Get.find<AdminTableController>()
                                              .addFilter(
                                                  Category.values[index].name);
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ));
                        }),
                  ),
                ),
                ExpansionPanel(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  isExpanded: expController.isOpen[1],
                  headerBuilder: (context, bool isExpanded) => Text(
                    "Price",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  body: Column(
                    children: [
                      Text(
                        "Price range ${expController.range.value.start.toInt()} - ${expController.range.value.end.toInt()}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                      RangeSlider(
                        values: expController.range.value,
                        onChanged: (value) => expController.changeRange(value),
                        min: 0,
                        max: 10000,
                        divisions: 100,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class Results extends StatelessWidget {
  Results({super.key});
 final AdminTableController productController = Get.find<AdminTableController>();

  @override
  Widget build(BuildContext context) {
            print(productController.results.length);
    return RefreshIndicator(
      onRefresh: () => Future.sync(() => productController.refresh()),
      child: Obx(
        ()=> SingleChildScrollView(
          child: Table(border: TableBorder.all(color: Theme.of(context).colorScheme.onPrimary,borderRadius: BorderRadius.circular(8)),
            children: [
              TableRow(children: [
                Text("No.",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                Text("name",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                Text("id",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                Text("price",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                Text("image",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
              ]),
              ...productController.results.asMap().entries.map((e) {
                return TableRow(children: [
                  GestureDetector(onTap: () {
                    print("${e.key}");
                    Get.to(()=> EditProduct(),arguments: {'product':e.value});
                  },
                  child: Text("${e.key+1}",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),)),
                  Text(e.value.name.toString(),style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                  Text(e.value.id.toString(),style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                  Text(e.value.price.toString(),style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                  e.value.imageUrl.isNotEmpty?Icon(Icons.check,color: Colors.green,):Icon(Icons.cancel_outlined,color: Colors.red,),
                  // Text(e.value.imageUrl.isNotEmpty.toString(),style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                ]);
              }),
              TableRow(children: [
                Text("price",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                Text("id",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                TextButton(
                  onPressed: () {  if(productController.offset.value!=-1){print(productController.results.length);
                                    productController.loadNextPage(); }
                                    },
                  child: Text("next",style: productController.offset.value!=-1? TextStyle(color: Theme.of(context).colorScheme.onPrimary): TextStyle(color: Theme.of(context).colorScheme.tertiary),),
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary),
                  ),),
                TextButton(
                  onPressed: () {  print(productController.results.length);
                                    productController.refresh(); 
                                    },
                  child: Text("refresh",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary),
                  ),),
                Text("price",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
              ]),
            ],
          
          ),
        ),
      ),
    );
  }
}