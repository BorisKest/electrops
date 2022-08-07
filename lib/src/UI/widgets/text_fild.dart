import 'package:flutter/material.dart';

class CustomTextFild extends StatelessWidget {
  final TextEditingController controller;
  final String textLabel;
  bool obscureText = false;
  CustomTextFild(
      {Key? key,
      required this.controller,
      required this.textLabel,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: textLabel,
      ),
    );
  }
}
