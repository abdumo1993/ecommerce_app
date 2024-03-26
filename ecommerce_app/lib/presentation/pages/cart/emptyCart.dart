import 'package:ecommerce_app/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
                width: 800,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Image.asset(
                      "lib/assets/images/parcel 1.png",
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "Your Cart is Empty",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ContinueButton(
                      onPress: () => print("Explore Categories"),
                      child: Text(
                        "Explore Categories",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
