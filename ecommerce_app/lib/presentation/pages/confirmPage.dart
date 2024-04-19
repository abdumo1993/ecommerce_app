import 'package:ecommerce_app/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text(
              "Confirm Your Email",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "A confirmation link has been sent to your email. please click on it to confirm your email address.",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmedEmail extends StatefulWidget {
  const ConfirmedEmail({super.key});

  @override
  State<ConfirmedEmail> createState() => _ConfirmedEmailState();
}

class _ConfirmedEmailState extends State<ConfirmedEmail> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 5), () => Get.offNamed("/home"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text(
              "Email Verified.",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Your Email has been Verified. redirecting to Home Page...",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
