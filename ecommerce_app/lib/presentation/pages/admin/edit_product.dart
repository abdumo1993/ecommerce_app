import 'package:ecommerce_app/core/utils/category_enum.dart';
import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:ecommerce_app/presentation/controllers/edit_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EditProduct extends StatelessWidget {
  EditProduct({
    super.key,
  });
  final Product? product = Get.arguments['product'];
  final _formKey = GlobalKey<FormState>();
  void start(EditProductController controller) {
    controller.NameController.text = product!.name.toString();
    controller.BrandController.text = product!.brand.toString();
    controller.DetailController.text = product!.details.toString();
    controller.CountController.text = product!.count.toString();
    controller.PriceController.text = product!.price.toString();
    if (product!.imageUrl.isNotEmpty) {
      controller.ImagesController.text = product!.imageUrl[0].toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final EditProductController controller = Get.put(EditProductController());
    start(controller);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Theme.of(context).colorScheme.primary,
            constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, bottom: 30),
                  child: Row(
                    children: [
                      Ink(
                        decoration: ShapeDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            shape: CircleBorder()),
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: ImageIcon(
                            color: Theme.of(context).colorScheme.onSecondary,
                            AssetImage(
                              "lib/assets/images/arrowleft2.png",
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Edit Product",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Spacer(),
                    ],
                  ),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            constraints: BoxConstraints(maxWidth: 500),
                            child: TextFormField(
                              controller: controller.NameController,
                              validator: (value) {
                                controller.validateName();
                                return controller.NameError.value;
                              },
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              decoration: InputDecoration(
                                  hintText: product!.name,
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                  labelText: "Name",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  floatingLabelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  border: OutlineInputBorder(
                                      // borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  fillColor:
                                      Theme.of(context).colorScheme.secondary,
                                  filled: true),
                              
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            constraints: BoxConstraints(maxWidth: 500),
                            child: TextFormField(
                              controller: controller.BrandController,
                              validator: (value) {
                                controller.validateBrand();
                                return controller.BrandError.value;
                              },
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              decoration: InputDecoration(
                                  hintText: product!.brand,
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                  labelText: "brand",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  floatingLabelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  border: OutlineInputBorder(
                                      // borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  fillColor:
                                      Theme.of(context).colorScheme.secondary,
                                  filled: true),
                              
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            constraints: BoxConstraints(maxWidth: 500),
                            child: TextFormField(
                              maxLines: 5,
                              controller: controller.DetailController,
                              validator: (value) {
                                controller.validateDetail();
                                return controller.DetailError.value;
                              },
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              decoration: InputDecoration(
                                  hintText: product!.details,
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                  labelText: "Details",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  floatingLabelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  border: OutlineInputBorder(
                                      // borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  fillColor:
                                      Theme.of(context).colorScheme.secondary,
                                  filled: true),
                              
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            constraints: BoxConstraints(maxWidth: 500),
                            child: TextFormField(
                              controller: controller.CountController,
                              validator: (value) {
                                controller.validateCount();
                                return controller.CountError.value;
                              },
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              decoration: InputDecoration(
                                  hintText: product!.count.toString(),
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                  labelText: "Number of items available",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  floatingLabelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  border: OutlineInputBorder(
                                      // borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  fillColor:
                                      Theme.of(context).colorScheme.secondary,
                                  filled: true),
                              
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            constraints: BoxConstraints(maxWidth: 500),
                            child: TextFormField(
                              controller: controller.PriceController,
                              validator: (value) {
                                controller.validatePrice();
                                return controller.PriceError.value;
                              },
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              decoration: InputDecoration(
                                  hintText: product!.price.toString(),
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                  labelText: "Price",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  floatingLabelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  border: OutlineInputBorder(
                                      // borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  fillColor:
                                      Theme.of(context).colorScheme.secondary,
                                  filled: true),
                              
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            constraints: BoxConstraints(maxWidth: 500),
                            child: TextFormField(
                              maxLines: 5,
                              controller: controller.ImagesController,
                              validator: (value) {
                                controller.validateImages();
                                return controller.ImagesError.value;
                              },
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              decoration: InputDecoration(
                                  hintText: product!.imageUrl.isNotEmpty
                                      ? product!.imageUrl[0].toString()
                                      : "",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                                  labelText: "Images",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  floatingLabelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  border: OutlineInputBorder(
                                      // borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  fillColor:
                                      Theme.of(context).colorScheme.secondary,
                                  filled: true),
                              
                            ),
                          ),
                        ),
                        Obx(
                          () => DropdownMenu(
                            initialSelection: product!.category,
                            enableFilter: true,
                            enableSearch: false,
                            errorText: controller.CategoryError.value,
                            controller: controller.CategoryController,
                            onSelected: (value) {
                              controller.validateCategory();
                              if (value != null) {
                                controller.CategoryController.text = value;
                              }
                            },
                            dropdownMenuEntries: categoryToList(),
                            label: Text("Category"),
                            inputDecorationTheme: InputDecorationTheme(
                              fillColor:
                                  Theme.of(context).colorScheme.secondary,
                              filled: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              floatingLabelStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              labelStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                            menuStyle: MenuStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.secondary),
                              shadowColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.onPrimary),
                              elevation: MaterialStatePropertyAll(2),
                              surfaceTintColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.onPrimary),
                            ),
                            textStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            constraints: BoxConstraints(maxWidth: 300),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.submitForm();
                                  // Proceed with form submission
                                  // Get.toNamed("/home");
                                }
                              },
                              child: Text("Edit"),
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Theme.of(context).colorScheme.tertiary),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                // minimumSize: MaterialStatePropertyAll(25 as Size?),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Add product"),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.secondary),
                              foregroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.onPrimary)),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("delete product"),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Colors.red),
                              foregroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).colorScheme.onPrimary)),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductFormField extends StatelessWidget {
  const ProductFormField({
    super.key,
    required this.fieldName,
    this.keyboardType = TextInputType.text,
  });
  final TextInputType? keyboardType;
  final String fieldName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        constraints: BoxConstraints(maxWidth: 500),
        child: TextFormField(
          keyboardType: keyboardType,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          decoration: InputDecoration(
              hintText: fieldName,
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSecondary),
              labelText: fieldName,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              labelStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              border: OutlineInputBorder(
                  // borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              fillColor: Theme.of(context).colorScheme.secondary,
              filled: true),
          // controller: ,
          // validator: (value) {
          //   // editUserController.validateLastName();
          //   // return editUserController.lastNameError.value;
          // },
        ),
      ),
    );
  }
}

List<DropdownMenuEntry> categoryToList() {
  final ButtonStyle btnStyle = ButtonStyle(
    backgroundColor:
        MaterialStatePropertyAll(ThemeData.dark().colorScheme.primary),
  );
  var categoryList = List.generate(
      Category.values.length,
      (index) => DropdownMenuEntry(
          value: Category.values[index].name,
          label: Category.values[index].name,
          style: btnStyle));

  if (categoryList.isNotEmpty)
    return categoryList;
  else
    return [];
}
