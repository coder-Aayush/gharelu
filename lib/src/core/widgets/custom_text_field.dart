import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';

class CustomTextField extends StatelessWidget ***REMOVED***
  const CustomTextField(***REMOVED***
    Key? key,
    required this.title,
    required this.controller,
    this.inputFormatters,
    this.onTap,
    this.isEnable = true,
    this.isPassword = false,
    this.error,
    this.onChanged,
    this.textInputType = TextInputType.name,
  ***REMOVED***) : super(key: key);
  final String title;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final bool isEnable;
  final bool isPassword;
  final String? error;
  final Function(String)? onChanged;
  final TextInputType textInputType;

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          onChanged: onChanged,
          controller: controller,
          inputFormatters: inputFormatters,
          keyboardType: textInputType,
          enableSuggestions: true,
          onTap: onTap,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: title,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: error != null && error!.isNotEmpty
                  ? AppColors.errorColor
                  : AppColors.primaryColor,
            )),
          ),
        ),
        if (error != null && error!.isNotEmpty)
          Text(
            error ?? '',
            style: AppStyles.text12PxRegular.error,
          ),
***REMOVED***
    );
  ***REMOVED***
***REMOVED***
