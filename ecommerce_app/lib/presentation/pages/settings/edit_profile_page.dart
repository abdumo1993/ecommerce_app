import 'package:ecommerce_app/presentation/widgets/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});
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
                    "Edit Profile",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Spacer(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
              backgroundImage: AssetImage("lib/assets/images/Rectangle 9.png"),
              radius: 50,
                        ),
            ),
          SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: myTextField(
                controller: adress,
                palceholder: "Name",
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: myTextField(
                controller: adress,
                palceholder: "email",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: myTextField(
                controller: adress,
                palceholder: "phone",
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.4,),
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
