import 'package:ecommerce_app/widgets/button.dart';
import 'package:ecommerce_app/widgets/myTextField.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
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
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xF4F4F4).withOpacity(1),
                  borderRadius: BorderRadius.circular(100),),
                child: IconButton(
                  icon: ImageIcon(
                    AssetImage("lib/assets/images/arrowleft2.png"),
                    size: 40, // Adjust the size as needed
                  ),
                  onPressed: () => print("back"),
                ),
              ),
              Text("Create Account",
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
                        palceholder: "First Name",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: myTextField(
                        keyboardType: TextInputType.emailAddress,
                        palceholder: "Last Name",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                    ContinueButton(
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
                        Text("Forgot Password?"),
                        SizedBox(width: 5,),
                        Text(
                          "Reset",
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
