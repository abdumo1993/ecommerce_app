import 'package:ecommerce_app/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  final String message;
  const ErrorPage({super.key, this.message = "Something went Wrong."});

  @override
  Widget build(BuildContext context) {
        print('args ${Get.arguments}');
    return Scaffold(
appBar: AppBar(leading: backButton() ,backgroundColor: Colors.transparent,),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        alignment: Alignment.center,
        padding:const  EdgeInsets.all(30.0),
        child: Text(Get.arguments!["message"]?? message, style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
      ),
    );
  }
}
