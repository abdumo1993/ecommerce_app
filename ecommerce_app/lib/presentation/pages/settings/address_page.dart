import 'package:ecommerce_app/presentation/pages/settings/body.dart';
import 'package:ecommerce_app/presentation/pages/settings/edit_address_page.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.secondary)),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EditAddressPage(
                    createNewAddress: true,
                  )),
        ),
        icon: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            CustomTextBtn(
              trailing: Text(
                "Edit",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditAddressPage(
                          createNewAddress: false,
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
