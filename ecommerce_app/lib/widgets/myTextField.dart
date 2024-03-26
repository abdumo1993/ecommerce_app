import 'package:flutter/material.dart';

class myTextField extends StatefulWidget {
  final TextInputType? keyboardType;
  final bool obscure;
  final String? palceholder;
  final Widget? prefix;
   final double? borderRadius;
   final TextEditingController controller;
   final Function? validator;
   
   myTextField(
      {super.key,
      this.keyboardType = TextInputType.text,
      this.obscure = false,
      this.palceholder,
      this.prefix, this.borderRadius, required this.controller, this.validator});

  @override
  State<myTextField> createState() => _myTextFieldState();
}

class _myTextFieldState extends State<myTextField> {
   late bool _obscure;
   @override
  void initState() {
    // TODO: implement initState
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

        prefix: widget.prefix,
        filled: true,
        hintText: widget.palceholder,
        hintStyle:
            TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSecondary),
            
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius != null ? widget.borderRadius! : 10))),
        fillColor:Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
