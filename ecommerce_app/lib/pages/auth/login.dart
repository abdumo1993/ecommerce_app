import 'package:ecommerce_app/Controllers/auth.dart';
import 'package:ecommerce_app/pages/products/productDetail.dart';
import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  LoginPage({super.key});

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
                  Text("Sign in",
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
                        Container(
                            child: myTextField(
                          controller: loginController.passwordController,
                          validator: (value) {
                            loginController.validatePassword();
                            return loginController.passwordError.value;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscure: true,
                          palceholder: "Password",
                        )),
                        SizedBox(
                          height: 15,
                        ),
                        ContinueButton(
                          onPress: () {
                            print("here");
                            if (_formKey.currentState!.validate()) {
                              // Proceed with form submission
                            Get.toNamed("/home");
                            }
                          },
                          child: Text(
                            "Continue",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "Dont have an Account?",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              
                              onTap: () {
                                Get.toNamed("/register");
                              },
                              child: Text(
                                "Create One",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary),
                              ),
                            ),
                          ],
                        )
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
