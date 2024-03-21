import "package:flutter/material.dart";
class myButton extends StatelessWidget {
  final Function onPress;
  final Widget child;
  const myButton({super.key, required this.onPress, required this.child});

  @override
  Widget build(BuildContext context) {
    return TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(20)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF8E6CEF)),
                      ),
                      onPressed:() => onPress(),
                      child: child
                    );
  }
}