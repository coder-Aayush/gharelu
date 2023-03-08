import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.title,
    required this.controller,
    this.inputFormatters,
    this.onTap,
    this.isEnable = true,
    this.isPassword = false,
    this.error,
    this.onChanged,
    this.textInputType = TextInputType.name,
    this.maxLength,
    this.textCapitalization,
    this.maxLines,
    this.warning,
    this.readOnly = false,
    this.labelText,
  }) : super(key: key);

  final String? title;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final bool isEnable;
  final bool isPassword;
  final String? error;
  final Function(String)? onChanged;
  final TextInputType textInputType;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final int? maxLines;
  final String? warning;
  final bool readOnly;
  final String? labelText;

  bool get hasError => error != null && (error ?? '').trim().isNotEmpty;

  bool get hasWarning => warning != null && (warning ?? '').trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          onChanged: onChanged,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          controller: controller,
          inputFormatters: inputFormatters,
          keyboardType: textInputType,
          enableSuggestions: true,
          onTap: onTap,
          obscureText: isPassword,
          enabled: isEnable,
          maxLength: maxLength,
          maxLines: maxLines ?? 1,
          readOnly: readOnly,
          decoration: InputDecoration(
            labelText: labelText,
            counter: const SizedBox.shrink(),
            hintText: title,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: borderColor,
              width: 1.5,
            )),
          ),
        ),
        if (hasWarning)
          Text(
            warning ?? '',
            style: AppStyles.text12PxMedium.warning,
          ),
        if (hasError)
          Text(
            error ?? '',
            style: AppStyles.text12PxRegular.error,
          ),
      ],
    );
  }

  Color get borderColor {
    if (hasError) {
      return AppColors.errorColor;
    }
    if (hasWarning) {
      return AppColors.warningColor;
    }
    return AppColors.primaryColor;
  }
}
