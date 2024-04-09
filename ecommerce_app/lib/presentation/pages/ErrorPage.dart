import 'package:ecommerce_app/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  final String message;
  final String? backDest;
  const ErrorPage(
      {super.key, this.message = "Something went Wrong.", this.backDest});

  @override
  Widget build(BuildContext context) {
    print('args ${Get.arguments}');
    var errMessage = (Get.arguments == null
        ? message
        : Get.arguments!["message"] == null
            ? message
            : Get.arguments!["message"]!);
    return Scaffold(
      appBar: AppBar(
        leading: backButton(
          nextPageName: backDest,
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30.0),
        child: Text(
          errMessage,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}
