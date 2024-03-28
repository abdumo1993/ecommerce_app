import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  final String message;
  const ErrorPage({super.key, this.message = "Something went Wrong."});

  @override
  Widget build(BuildContext context) {
        print('args ${Get.arguments}');
    return Material(
      color: Theme.of(context).colorScheme.primary,
      child: Container(
        alignment: Alignment.center,
        padding:const  EdgeInsets.all(30.0),
        child: Text(Get.arguments!["message"]?? message),
      ),
    );
  }
}
