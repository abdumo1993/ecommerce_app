import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/myTextField.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sign in",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      child: myTextField(
                        keyboardType: TextInputType.emailAddress,
                        palceholder: "Email Address",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        child: myTextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscure: true,
                      palceholder: "Password",
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
                    myButton(
                      onPress: () => print("here"),
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
                        Text("Dont have an Account?"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Create One",
                          style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
