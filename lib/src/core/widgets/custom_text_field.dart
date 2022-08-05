import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    required this.controller,
    this.inputFormatters,
    this.onTap,
    this.isEnable = true,
    this.isPassword = false,
  }) : super(key: key);
  final String title;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final bool isEnable;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: inputFormatters,
      enableSuggestions: true,
      onTap: onTap,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: title,
      ),
    );
  }
}
