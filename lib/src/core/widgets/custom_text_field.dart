import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget ***REMOVED***
  const CustomTextField(***REMOVED***
    Key? key,
    required this.title,
    required this.controller,
    this.inputFormatters,
    this.onTap,
    this.isEnable = true,
    this.isPassword = false,
  ***REMOVED***) : super(key: key);
  final String title;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final bool isEnable;
  final bool isPassword;

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
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
  ***REMOVED***
***REMOVED***
