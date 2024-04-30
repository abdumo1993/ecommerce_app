import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.offNamed("/home"),
      child: Material(
        
        child: Container(alignment: Alignment.center,child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.onPrimary,
        ),),
      ),
    );
  }
}