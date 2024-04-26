import 'package:ecommerce_app/presentation/controllers/adress_edit_controller.dart';
import 'package:ecommerce_app/presentation/widgets/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAddressPage extends StatelessWidget {
  EditAddressPage({super.key, required this.createNewAddress});
  final bool createNewAddress;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final EditAddressController controller = Get.put(EditAddressController(createNewAddress: createNewAddress));
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                        onPressed: () => Navigator.pop(context),
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
                      createNewAddress? "Add Address": "Edit Address",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Spacer(),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //   child: myTextField(
              //     controller: adress,
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //   child: myTextField(
              //     controller: adress,
              //   ),
              // ),
              Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              constraints: BoxConstraints(maxWidth: 500),
                              child: TextFormField(
                                controller: controller.streetController,
                                validator: (value) {
                                  controller.validateStreet();
                                  return controller.streetError.value;
                                },
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary),
                                decoration: InputDecoration(
                                    hintText: controller.address?.street ?? "Street",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary),
                                    labelText: "Street Address",
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
                          Padding(padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child:Container(
                        width: MediaQuery.of(context).size.width,
                        constraints: BoxConstraints(maxWidth: 500),
                        child: TextFormField(
                                    controller: controller.cityController,
                                    validator: (value) {
                                      controller.validateCity();
                                      return controller.cityError.value;
                                    },
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).colorScheme.onPrimary),
                                    decoration: InputDecoration(
                                        hintText: controller.address?.city ?? "City",
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary),
                                        labelText: "City",
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
                      ),),
                            Padding(padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child:Container(
                                width: MediaQuery.of(context).size.width,
                                constraints: BoxConstraints(maxWidth: 500),
                                child: TextFormField(
                                  controller: controller.stateController,
                                  validator: (value) {
                                    controller.validateState();
                                    return controller.stateError.value;
                                  },
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.onPrimary),
                                  decoration: InputDecoration(
                                      hintText: controller.address?.state ?? "State",
                                      hintStyle: TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary),
                                      labelText: "State",
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
                              ),),
                            Padding(padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child:Container(
                        width: MediaQuery.of(context).size.width,
                        constraints: BoxConstraints(maxWidth: 500),
                        child: TextFormField(
                                    controller: controller.countryController,
                                    validator: (value) {
                                      controller.validateCountry();
                                      return controller.countryError.value;
                                    },
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).colorScheme.onPrimary),
                                    decoration: InputDecoration(
                                        hintText: controller.address?.country ?? "Country",
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary),
                                        labelText: "Country",
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
                      ),),
                            Padding(padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child:Container(
                                width: MediaQuery.of(context).size.width,
                                constraints: BoxConstraints(maxWidth: 500),
                                child: TextFormField(
                                  controller: controller.postalCodeController,
                                  validator: (value) {
                                    controller.validatePostalCode();
                                    return controller.postalCodeError.value;
                                  },
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.onPrimary),
                                  decoration: InputDecoration(
                                      hintText: controller.address?.postalCode ?? "Postal Code",
                                      hintStyle: TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary),
                                      labelText: "Postal Code",
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
                              ),),

              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  constraints: BoxConstraints(maxWidth: 500),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                          controller.submitForm();
                          // Proceed with form submission
                          // Get.toNamed("/home");
                        }
                        },
                    child: Text("Save"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.tertiary),
                        foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.onPrimary),
                        // minimumSize: MaterialStatePropertyAll(25 as Size?),
                        ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              if(!createNewAddress) Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  constraints: BoxConstraints(maxWidth: 300),
                  child: ElevatedButton(
                    onPressed: () {
                        Get.bottomSheet(DialogButton(controller: controller,));
                        },
                    child: Text("Delete"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Colors.red),
                        foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.onPrimary),
                        // minimumSize: MaterialStatePropertyAll(25 as Size?),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DialogButton extends StatelessWidget {
  final EditAddressController controller;
  const DialogButton({
    super.key, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 300,
        maxWidth: 500
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Are you sure you want to delete this address?",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          textAlign: TextAlign.center,),
          SizedBox(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      controller.deleteAddress();
                      Get.back();
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.tertiary),
                        foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.onPrimary),
                        // minimumSize: MaterialStatePropertyAll(25 as Size?),
                        ),
                child: Text("Yes"),
                        ),
                        TextButton(
                    onPressed: () {
                      Get.back();
                    },style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.secondary),
                        foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.onPrimary),
                        // minimumSize: MaterialStatePropertyAll(25 as Size?),
                        ),
                child: Text("No"),
                        ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
