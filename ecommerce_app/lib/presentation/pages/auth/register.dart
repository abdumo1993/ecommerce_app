import 'package:ecommerce_app/presentation/controllers/auth.dart';
import 'package:ecommerce_app/presentation/pages/auth/login.dart';
import 'package:ecommerce_app/presentation/pages/home/home.dart';
import 'package:ecommerce_app/presentation/widgets/button.dart';
import 'package:ecommerce_app/presentation/widgets/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _firstnameController = TextEditingController();
  // TextEditingController _lastnameController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();
  final registerConroller = Get.put(RegisterConroller());
  final _formKey = GlobalKey<FormState>();
  
  RegisterPage({super.key});

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
                  const backButton(nextPageName: "login"),
                  Text("Create Account",
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
                            controller: registerConroller.firstNameController,
                            validator: (value) {
                              registerConroller.validateFirstName();
                              return registerConroller.firstNameError.value;
                            },
                            keyboardType: TextInputType.emailAddress,
                            palceholder: "First Name",
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: myTextField(
                            controller: registerConroller.lastNameController,
                            validator: (value) {
                              registerConroller.validateLastName();
                              return registerConroller.lastNameError.value;
                            },
                            keyboardType: TextInputType.emailAddress,
                            palceholder: "Last Name",
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: myTextField(
                            controller: registerConroller.emailController,
                            validator: (value) {
                              registerConroller.validateEmail();
                              return registerConroller.emailError.value;
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
                              controller: registerConroller.passwordController,
                              validator: (value) {
                                registerConroller.validatePassword();
                                return registerConroller.passwordError.value;
                              },
                          keyboardType: TextInputType.visiblePassword,
                          obscure: true,
                          palceholder: "Password",
                        )),
                         SizedBox(
                          height: 15,
                        ),
                        Container(
                            child: myTextField(
                              controller: registerConroller.confirmController,
                              validator: (value) {
                                registerConroller.validateConfirm();
                                return registerConroller.confirmError.value;
                              },
                          keyboardType: TextInputType.visiblePassword,
                          obscure: true,
                          palceholder: "Confirm Password",
                        )),

                        SizedBox(
                          height: 15,
                        ),
                        // TextButton(
                        //   style: ButtonStyle(
                        //     padding: MaterialStateProperty.all<EdgeInsets>(
                        //         EdgeInsets.all(20)),
                        //     backgroundColor:
                        //         MaterialStateProperty.all<Color>(Color(0xFF8E6CEF)),
                        //   ),
                        //   onPressed: () => print("login"),
                        //   child:
                        // ),
                        ContinueButton(
                          onPress: () {
                            print("regisetered");
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
                              "Forgot Password?",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("/forgotPassword");
                              },
                              child: Text(
                                "Reset",
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