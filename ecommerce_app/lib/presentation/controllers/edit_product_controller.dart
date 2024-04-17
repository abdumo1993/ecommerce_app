import 'package:ecommerce_app/core/utils/category_enum.dart';
import 'package:ecommerce_app/core/utils/exceptions.dart';
import 'package:ecommerce_app/data/data_sources/edit_product.dart';
import 'package:ecommerce_app/data/datasources/api_client.dart';
import 'package:ecommerce_app/data/repositories/edit_product.dart';
import 'package:ecommerce_app/domain/entities/product.dart';
import 'package:ecommerce_app/domain/usecases/edit_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductController extends GetxController {

  DioClient dio = DioClient();

  // final name = "".obs;
  // final brand = "".obs;
  // final details = "".obs;
  // final count = "".obs;
  // final price = "".obs;
  // final images = "".obs;
  // final category = "".obs;


bool valid = false;
  List<String> categoriesEnum = Category.values.map((e) => e.name).toList();

  RxnString NameError = RxnString(null);
  RxnString BrandError = RxnString(null);
  RxnString DetailError = RxnString(null);
  RxnString CountError = RxnString(null);
  RxnString PriceError = RxnString(null);
  RxnString ImagesError = RxnString(null);
  RxnString CategoryError = RxnString(null);


  TextEditingController NameController = TextEditingController();
  TextEditingController BrandController = TextEditingController();
  TextEditingController DetailController = TextEditingController();
  TextEditingController CountController = TextEditingController();
  TextEditingController PriceController = TextEditingController();
  TextEditingController ImagesController = TextEditingController();
  TextEditingController CategoryController = TextEditingController();


  final RegExp alphanumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
  
  void validateName() {
    if (NameController.text.length < 3 && NameController.text.isNotEmpty) {
      NameError.value = "Product Name must be at least 3 characters";
      valid = false;
    }else if(!alphanumericRegex.hasMatch(NameController.text.removeAllWhitespace)&& NameController.text.isNotEmpty){
      NameError.value = "Product Name must be letters and numbers only";
      valid = false;
    } else {
      NameError.value = null;
      valid = true;
    }
  }
  void validateBrand() {
    if (BrandController.text.length < 3 && BrandController.text.isNotEmpty) {
      BrandError.value = "Brand Name must be at least 3 characters";
      valid = false;
    }else if(!alphanumericRegex.hasMatch(BrandController.text.removeAllWhitespace)&& BrandController.text.isNotEmpty){
      BrandError.value = "Brand Name must be letters and numbers only";
      valid = false;
    } else {
      BrandError.value = null;
      valid = true;
    }
  }  
  void validateDetail() {
    if (DetailController.text.length < 3 && DetailController.text.isNotEmpty) {
      DetailError.value = "Detail must be at least 3 characters";
      valid = false;
    }else if(!alphanumericRegex.hasMatch(DetailController.text.removeAllWhitespace)&& DetailController.text.isNotEmpty){
      DetailError.value = "Detail must be letters and numbers only";
      valid = false;
    } else {
      DetailError.value = null;
      valid = true;
    }
  }
  void validateCount() {
    if(!CountController.text.removeAllWhitespace.isNumericOnly&& CountController.text.isNotEmpty){
      CountError.value = "Must be numbers only";
      valid = false;
    }else {
      CountError.value = null;
      valid = true;
    }
  }  
  void validatePrice() {
    if(!PriceController.text.removeAllWhitespace.isCurrency&& PriceController.text.isNotEmpty){
      PriceError.value = "Must be numbers only";
      valid = false;
    } else {
      PriceError.value = null;
      valid = true;
    }
  } 
  void validateImages() {
    var urls = ImagesController.text.split('\n');
    if (!urls.every((element) => element.isURL) && ImagesController.text.isNotEmpty) {
      ImagesError.value = "Please enter image urls separately on each line and remove all whitespaces";
      valid = false;
    } else {
      ImagesError.value = null;
      valid = true;
    }
  }
  void validateCategory() {
    if (!categoriesEnum.contains(CategoryController.text) && CategoryController.text.isNotEmpty) {
      CategoryError.value = "Please choose a valid category";
      valid = false;
    } else {
      CategoryError.value = null;
      valid = true;
    }
  }

  void submitForm() async {
    
    validateName();
    validateBrand();
    validateDetail();
    validateCount();
    validatePrice();
    validateImages();
    validateCategory();
    var editedProduct = AdminProduct();
      editedProduct.name = NameController.text;
        editedProduct.price = double.tryParse(PriceController.text);
        if(ImagesController.text!="") editedProduct.imageUrl= ImagesController.text.split('\n');
        editedProduct.id = Get.arguments['product'].id;
        editedProduct.brand = BrandController.text;
        editedProduct.details = DetailController.text;
        editedProduct.count = int.tryParse(CountController.text);
        editedProduct.category = CategoryController.text;
    if (editedProduct.toJson().toString() == Get.arguments['product'].toJson().toString()) {
      //something happens
      Get.snackbar("Nothing to change","Please enter the field you want to edit",
                backgroundColor: ThemeData.dark().colorScheme.secondary,
                colorText: ThemeData.dark().colorScheme.onPrimary);
    } 
    else if (editedProduct.toJson().toString() == {}.toString()) {
      //something happens
      Get.snackbar("Nothing to change","All fields are empty. Please enter the field you want to edit",
                backgroundColor: ThemeData.dark().colorScheme.secondary,
                colorText: ThemeData.dark().colorScheme.onPrimary);
    } 
    else if (valid){
      try {
        var use = EditProductCase(
            repo:
                EditProductRepositoryImpl(editProductProvider: EditProductDataSource()));
        var res = await use.editProduct(editedProduct);
        res == true
            ? (
                Get.snackbar(
                    "Update Product", "Product updated successfully",
                    backgroundColor: ThemeData.dark().colorScheme.secondary,
                    colorText: ThemeData.dark().colorScheme.onPrimary),
              )
            : Get.snackbar("Update details",
                "Failed to update Product details. Please try again",
                backgroundColor: ThemeData.dark().colorScheme.secondary,
                colorText: ThemeData.dark().colorScheme.onPrimary);
      } on AuthException catch (e) {
        // redendant with badresopnseexcepitonoi to be removed after verification.
        Get.snackbar("invalid tokens", "please login to your account",
            backgroundColor: ThemeData.dark().colorScheme.secondary,
            colorText: ThemeData.dark().colorScheme.onPrimary);
      } on NetworkException catch (e) {
        Get.snackbar(
            "Network Error", "Please check your connection and try again",
            backgroundColor: ThemeData.dark().colorScheme.secondary,
            colorText: ThemeData.dark().colorScheme.onPrimary);
      } on BadResponseException catch (e) {
        if (e.statusCode == 500) {
          Get.snackbar("Server is busy",
              "Having trouble seving your requests, due to too many requests. Please try again later",
              backgroundColor: ThemeData.dark().colorScheme.secondary,
              colorText: ThemeData.dark().colorScheme.onPrimary);
        } else {
          Get.snackbar("Server is busy",
              "Having trouble seving your requests, due to too many requests. Please try again later",
              backgroundColor: ThemeData.dark().colorScheme.secondary,
              colorText: ThemeData.dark().colorScheme.onPrimary);
        }
      }
    }
    // on CustomeException catch (e) {
    //   Get.toNamed("/error", arguments: {"message": e.toString()});
    // } catch (e) {
    //   print(e.runtimeType);
    //   Get.toNamed("/error", arguments: {"message": "Something went wrong r"});
    // }
  }
}
