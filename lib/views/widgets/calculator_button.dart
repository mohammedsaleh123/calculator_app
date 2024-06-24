import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CalculatorButton extends StatelessWidget {
  final String text;
  Color? color;
  Color? textColor;
  VoidCallback onTap;
  CalculatorButton(
      {super.key,
      required this.text,
      this.color,
      this.textColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
