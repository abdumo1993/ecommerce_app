import 'package:ecommerce_app/Controllers/auth.dart';
import 'package:ecommerce_app/pages/auth/login.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCheckout extends StatelessWidget {
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _firstnameController = TextEditingController();
  // TextEditingController _lastnameController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();
  final registerConroller = Get.put(RegisterConroller());
  final _formKey = GlobalKey<FormState>();

  AddCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        
        child: Container(
          width: 800,
                  
        
          child: Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Theme.of(context).colorScheme.tertiary),
                          margin: EdgeInsets.all(20.0),
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$148",
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Add to Bag",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
            body: Container(
              color: Theme.of(context).colorScheme.primary,
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width < 800
                              ? MediaQuery.of(context).size.width
                              : 800,
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: IconButton(
                                  icon: ImageIcon(
                                    color: Theme.of(context).colorScheme.onSecondary,
                                    AssetImage("lib/assets/images/arrowleft2.png"),
                                    size: 40, // Adjust the size as needed
                                  ),
                                  onPressed: () => print("back"),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Checkout",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color:
                                            Theme.of(context).colorScheme.onPrimary),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                color: Theme.of(context).colorScheme.secondary,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  title: Text("Shipping Address",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                          fontSize: 12)),
                                  subtitle: Text("Add Shipping Address",
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).colorScheme.onPrimary,
                                          fontSize: 16)),
                                  trailing: Image.asset(
                                      "lib/assets/images/arrowright2.png",
                                      fit: BoxFit.contain,
                                      color:
                                          Theme.of(context).colorScheme.onSecondary),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                color: Theme.of(context).colorScheme.secondary,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  title: Text("Shipping Address",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                          fontSize: 12)),
                                  subtitle: Text("Add Shipping Address",
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).colorScheme.onPrimary,
                                          fontSize: 16)),
                                  trailing: Image.asset(
                                      "lib/assets/images/arrowright2.png",
                                      fit: BoxFit.contain,
                                      color:
                                          Theme.of(context).colorScheme.onSecondary),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 120,
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Subtotal", style: TextStyle(
                                    color: Theme.of(context).colorScheme.onSecondary
                                  )),
                                  Text("\$200", style: TextStyle(
                                    color: Theme.of(context).colorScheme.onPrimary
                                  )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Shipping Cost", style: TextStyle(
                                    color: Theme.of(context).colorScheme.onSecondary
                                  )),
                                  Text("\$8.00", style: TextStyle(
                                    color: Theme.of(context).colorScheme.onPrimary
                                  )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Tax", style: TextStyle(
                                    color: Theme.of(context).colorScheme.onSecondary
                                  )),
                                  Text("\$0.00", style: TextStyle(
                                    color: Theme.of(context).colorScheme.onPrimary
                                  )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total", style: TextStyle(
                                    color: Theme.of(context).colorScheme.onSecondary
                                  )),
                                  Text("\$208", style: TextStyle(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.bold
                                  )),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
