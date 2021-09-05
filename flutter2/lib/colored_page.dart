import 'package:flutter/material.dart';

class ColoredPage extends StatelessWidget {
  final Color? color;
  final String? buttonText;
  final void Function(BuildContext)? onTextTap;

  const ColoredPage(
      {Key? key, this.color, this.buttonText, required this.onTextTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: GestureDetector(
          onTap: () => onTextTap!(context),
          child: Text(
            buttonText ?? "Текст",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
