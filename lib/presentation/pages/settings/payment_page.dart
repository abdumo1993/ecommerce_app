import 'package:ecommerce_app/presentation/pages/settings/body.dart';
import 'package:flutter/material.dart';

import 'edit_payment_page.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

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
              builder: (context) => EditPaymentPage(
                    createNewCard: true,
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
                    "Payment",
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
              trailing: ImageIcon(
                color: Theme.of(context).colorScheme.onPrimary,
                AssetImage(
                  "lib/assets/images/arrowright2.png",
                ),
              ),
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditPaymentPage(
                          createNewCard: false,
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
