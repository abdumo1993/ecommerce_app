import 'package:ecommerce_app/Controllers/auth.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 800,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Forgot Password",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary)),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: myTextField(
                            controller: loginController.emailController,
                            validator: (value) {
                              loginController.validateEmail();
                              return loginController.emailError.value;
                            },
                            keyboardType: TextInputType.emailAddress,
                            palceholder: "Email Address",
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ContinueButton(
                          onPress: () {
                             print("here");
      
                             Get.toNamed("/emailSent");
                             },
                          child: Text(
                            "Continue",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
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
    );
  }
}

class EmailSent extends StatelessWidget {
  const EmailSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
                width: 800,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
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
                    SizedBox(
                      height: 15,
                    ),
                    ContinueButton(
                      onPress: (){
                        Get.offAllNamed("login");
                      },
                      child: Text(
                        "Return to Login",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
