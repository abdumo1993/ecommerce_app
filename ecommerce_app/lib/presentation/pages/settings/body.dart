import 'package:ecommerce_app/domain/entities/edit_user.dart';
import 'package:ecommerce_app/presentation/controllers/auth.dart';
import 'package:ecommerce_app/presentation/controllers/settings_controller.dart';
import 'package:ecommerce_app/presentation/pages/settings/edit_profile_page.dart';
import 'package:ecommerce_app/presentation/pages/settings/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'address_page.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({
    super.key,
  });
// Center(child: Container(constraints: BoxConstraints(maxWidth: 600) ,child: SettingsBody()))
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 600) ,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 25),
              CircleAvatar(
                backgroundImage: AssetImage("lib/assets/images/Rectangle 9.png"),
                radius: 50,
              ),
              SizedBox(height: 35),
              CustomUserTextBtn(),
              SizedBox(height: 10),
              CustomTextBtn(
                title: "Address",
                trailing: ImageIcon(
                  color: Theme.of(context).colorScheme.onPrimary,
                  AssetImage(
                    "lib/assets/images/arrowright2.png",
                  ),
                ),
                press: () => Get.toNamed("/address"),
              ),
              // CustomTextBtn(
              //   title: "Payment",
              //   trailing: ImageIcon(
              //     color: Theme.of(context).colorScheme.onPrimary,
              //     AssetImage(
              //       "lib/assets/images/arrowright2.png",
              //     ),
              //   ),
              //   press: () => Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => PaymentPage())),
              // ),
              CustomTextBtn(
                title: "Help",
                trailing: ImageIcon(
                  color: Theme.of(context).colorScheme.onPrimary,
                  AssetImage(
                    "lib/assets/images/arrowright2.png",
                  ),
                ),
              ),
              CustomTextBtn(
                title: "About",
                trailing: ImageIcon(
                  color: Theme.of(context).colorScheme.onPrimary,
                  AssetImage(
                    "lib/assets/images/arrowright2.png",
                  ),
                ),
                press:() => showAboutDialog(context: context,
                applicationName: "Ecommerce App",
                applicationVersion: "1.0.0",
                ),
              ),
              TextButton(
                  onPressed: () {
                    LogoutController controller = LogoutController();
                    controller.logout();
                  },
                  child: Text(
                    "Sign Out",
                    style: TextStyle(color: Color(0xFFFA3636)),
                  )),
              const SizedBox(
                height: 55,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomUserTextBtn extends StatelessWidget {
  const CustomUserTextBtn({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
  final GetUserModel? user = Get.find<SettingsController>().userData;
    return CustomTextBtn(
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user!=null && user.firstname!=null && user.firstname!=null? "${user.firstname!} ${user.lastname!}" :"username",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          Text(
            user!=null && user.email!=null? "${user.email}" :"email@gmail.com",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          Text(
            user!=null && user.phoneNumber!=null? "${user.phoneNumber}" :"123-567-890",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
      trailing: Text(
        "Edit",
        style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      press: () {
        // if(user!=null){
          Get.toNamed("/editProfile",arguments: {'user':user});
        // } else{
        //   Get.toNamed("/editProfile");
        // }
        },
    );
  }
}

class CustomTextBtn extends StatelessWidget {
  const CustomTextBtn(
      {super.key, this.title, this.leading, this.trailing, this.press});
  final String? title;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextButton(
        style: ButtonStyle(
            padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
            backgroundColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.secondary),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)))),
        onPressed: press,
        child: Row(
          children: [
            if (leading != null) leading!,
            Text(
              title ?? "",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                // fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Spacer(),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
