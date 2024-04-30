import 'package:ecommerce_app/presentation/widgets/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPaymentPage extends StatelessWidget {
  EditPaymentPage({super.key, required this.createNewCard});
  final bool createNewCard;
  final TextEditingController adress = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    createNewCard?"Add Card":"Edit Card",
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: myTextField(
                controller: adress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: myTextField(
                        controller: adress,
                      )),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: myTextField(
                        controller: adress,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: myTextField(
                controller: adress,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.6,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Save"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.tertiary),
                      foregroundColor: MaterialStatePropertyAll(
                          Colors.white),
                      // minimumSize: MaterialStatePropertyAll(25 as Size?),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
