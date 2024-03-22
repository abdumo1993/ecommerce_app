import 'package:flutter/material.dart';

class myTextField extends StatefulWidget {
  final TextInputType? keyboardType;
  final bool obscure;
  final String? palceholder;
  final Widget? prefix;
   final double? borderRadius;
  const myTextField(
      {super.key,
      this.keyboardType = TextInputType.text,
      this.obscure = false,
      this.palceholder,
      this.prefix, this.borderRadius});

  @override
  State<myTextField> createState() => _myTextFieldState();
}

class _myTextFieldState extends State<myTextField> {
   bool _obscure = true;
 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      obscureText: !_obscure,

      // style: TextStyle(fontSize: 16,),

      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(14),
        suffix: widget.obscure ? IconButton(icon: Icon(Icons.visibility), onPressed: () {
          setState(() {
            _obscure = !_obscure;
          });
        },): null,
        prefix: widget.prefix,
        filled: true,
        hintText: widget.palceholder,
        hintStyle:
            TextStyle(fontSize: 16, color: Color(0x272727).withOpacity(0.5)),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius != null ? widget.borderRadius! : 10))),
        fillColor: Color(0xF4F4F4).withOpacity(1),
      ),
    );
  }
}
