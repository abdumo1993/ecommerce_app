import 'package:ecommerce_app/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ConfirmPage extends StatelessWidget {
  final bool? message;
  const ConfirmPage({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    var truM = Get.arguments["sent"] ?? message;
    if (truM == null) {
      truM = false;
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30.0),
        child: truM
            ? Column(children: [
                Image.asset(
                  "lib/assets/images/image 4.png",
                  fit: BoxFit.contain,
                ),
                Text(
                  "We Sent You an Email to reset your password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ])
            : const defval(),
      ),
    );
  }
}

class defval extends StatelessWidget {
  const defval({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
