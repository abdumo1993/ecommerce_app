import 'package:ecommerce_app/presentation/controllers/address_controller.dart';
import 'package:ecommerce_app/presentation/pages/settings/body.dart';
import 'package:ecommerce_app/presentation/pages/settings/edit_address_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressController controller = Get.put(AddressController());
    return Obx(
      () => Scaffold(
        floatingActionButton: IconButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.secondary)),
          onPressed: () => Get.toNamed("/addAddress", arguments: {'address': null}),
          icon: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SingleChildScrollView(
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
                      "Address",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Spacer(),
                  ],
                ),
              ),
      
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.addressTypeChange();
                      },
                      child: Text("Shipping"),
                      style: ButtonStyle(
                        backgroundColor: controller.addressType.value
                            ? MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.tertiary)
                            : MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.secondary),
                        foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.secondary,
                      thickness: 5,
                      height: 5,
                      indent: 5,
                      endIndent: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        controller.addressTypeChange();
                      },
                      child: Text("Billing"),
                      style: ButtonStyle(
                        backgroundColor: controller.addressType.value
                            ? MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.secondary)
                            : MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.tertiary),
                        foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.onPrimary),
                      ),
                    )
                  ],
                ),
              ),
               if (controller.addressType.value)
                Shipping(controller: controller)
              else
                Billing(controller: controller),
              // ...controller.shippingAddressList.asMap().entries.map((e) => Container(
              //   constraints: BoxConstraints(maxWidth: 600),
              //   child: CustomTextBtn(
              //             title: "${e.value.street}, ${e.value.city}",
              //             trailing: Text(
              //         "Edit",
              //         style: TextStyle(
              //           color: Theme.of(context).colorScheme.tertiary,
              //         ),
              //       ),
              //       press: () => Get.toNamed("/editAddress", arguments: {'address': e.value}),
              //           ),
              // )),
            ],
          ),
        ),
      ),
    );
  }
}

class Shipping extends StatelessWidget {
  final AddressController controller;
  const Shipping({
    super.key, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.shippingAddressList.isNotEmpty? Column(
        children: [
          ...controller.shippingAddressList.asMap().entries.map((e) => Container(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: CustomTextBtn(
                            title: "${e.value.street ?? ''}, ${e.value.city ?? ''}",
                            trailing: Text(
                        "Edit",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      press: () => Get.toNamed("/editAddress", arguments: {'address': e.value}),
                          ),
                )),
        ],
      ): CustomTextBtn(title: "No Addresses Found",),
    );
  }
}

class Billing extends StatelessWidget {
  final AddressController controller;
  const Billing({
    super.key, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.billingAddressList.isNotEmpty? Column(
        children: [
          ...controller.billingAddressList.asMap().entries.map((e) => Container(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: CustomTextBtn(
                            title: "${e.value.street ?? ''}, ${e.value.city ?? ''}",
                            trailing: Text(
                        "Edit",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      press: () => Get.toNamed("/editAddress", arguments: {'address': e.value}),
                          ),
                )),
        ],
      ) : CustomTextBtn(title: "No Addresses Found",),
    );
  }
}
