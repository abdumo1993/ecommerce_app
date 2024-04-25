import 'package:ecommerce_app/presentation/controllers/edit_user_controller.dart';
import 'package:ecommerce_app/presentation/widgets/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});
  final TextEditingController adress = TextEditingController();
  final editUserController = Get.put(EditUserController());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                        onPressed: () => Get.back(),
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
                  Text("* Only enter the fields you want to edit",style: TextStyle(color: Theme.of(context).colorScheme.tertiary),),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        constraints: BoxConstraints(maxWidth: 500),
                        child: myTextField(
                            // index: 0,
                            labeltext: "First Name",
                            controller: editUserController.firstNameController,
                            palceholder: "First Name",
                            validator: (value) {
                              editUserController.validateFirstName();
                              return editUserController.firstNameError.value;
                            },
                          ),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        constraints: BoxConstraints(maxWidth: 500),
                  child: myTextField(
                    // index: 1,
                                labeltext: "Last Name",
                    controller: editUserController.lastNameController,
                    palceholder: "Last Name",
                    validator: (value) {
                      editUserController.validateLastName();
                      return editUserController.lastNameError.value;
                    },
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        constraints: BoxConstraints(maxWidth: 500),
                  child: myTextField(
                    // index: 2,
                                labeltext: "Email",
                    controller: editUserController.emailController,
                    palceholder: "email",
                    validator: (value) {
                      editUserController.validateEmail();
                      return editUserController.emailError.value;
                    },
                  ),
                ),
              ), Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        constraints: BoxConstraints(maxWidth: 500),
                  child: myTextField(
                    // index: 2,
                                labeltext: "PhoneNumber",
                    controller: editUserController.phoneController,
                    palceholder: "phone number",
                    validator: (value) {
                      editUserController.validatePhone();
                      return editUserController.phoneError.value;
                    },
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),
                  Text("* To edit password please fill both old and new password",style: TextStyle(color: Theme.of(context).colorScheme.tertiary),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        constraints: BoxConstraints(maxWidth: 500),
                  child: myTextField(
                    // index: 3,
                    obscure: true,
                                labeltext: "old password",
                    controller: editUserController.oldPasswordController,
                    palceholder: "old password",
                    validator: (value) {
                      editUserController.validatePasswordNotMatch();
                      return editUserController.passwordError.value;
                    },
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        constraints: BoxConstraints(maxWidth: 500),
                  child: myTextField(
                    // index: 3,
                    obscure: true,
                                labeltext: "new password",
                    controller: editUserController.newPasswordController,
                    palceholder: "new password",
                    validator: (value) {
                      editUserController.validatePassword();
                      editUserController.validatePasswordNotMatch();
                      return editUserController.confirmError.value;
                    },
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  constraints: BoxConstraints(maxWidth: 300),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        editUserController.submitForm();
                        // Proceed with form submission
                        // Get.toNamed("/home");
                      }
                    },
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
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}



class myTextField extends StatefulWidget {
  final TextInputType? keyboardType;
  final bool obscure;
  final String? palceholder;
  final Widget? prefix;
   final double? borderRadius;
   final TextEditingController controller;
   final Function? validator;
   final String labeltext;
   myTextField(
      {super.key,
      this.keyboardType = TextInputType.text,
      this.obscure = false,
      this.palceholder,
      this.prefix, this.borderRadius, required this.controller, this.validator, required this.labeltext});

  @override
  State<myTextField> createState() => _myTextFieldState();
}

class _myTextFieldState extends State<myTextField> {
   late bool _obscure;
   @override
  void initState() {
    super.initState();
_obscure = widget.obscure;
  }
 
  @override
  Widget build(BuildContext context) {
   
    return TextFormField(
      controller: widget.controller,
      validator: (value) => widget.validator!(value),
      keyboardType: widget.keyboardType,
      obscureText: _obscure,
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      cursorColor: Theme.of(context).colorScheme.onSecondary,

      // style: TextStyle(fontSize: 16,),

      decoration: InputDecoration(
        
        contentPadding: EdgeInsets.all(14),
        suffix: widget.obscure ? GestureDetector(child: Icon(_obscure ? Icons.visibility : Icons.visibility_off,color: Theme.of(context).colorScheme.onSecondary, ), onTap: () {
setState(() {
            _obscure = !_obscure;
          });
        },): null,

        filled: true,
        hintText: widget.palceholder,
        hintStyle:
            TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSecondary),
            labelText: widget.labeltext,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius != null ? widget.borderRadius! : 10))),
        fillColor:Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
