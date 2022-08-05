import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color primaryColor = const Color(0xFF7210FF);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color midGreyColor = const Color(0xFF989898);
  static const Color hintTextColor = const Color(0xFFE0E5E9);
  static const Color softBlack = const Color(0xff0F0E0E);
  static const Color transparent = Colors.transparent;

  static const LinearGradient circleGradient = const LinearGradient(
    begin: FractionalOffset.centerLeft,
    end: FractionalOffset.centerRight,
    stops: [0, 0.55, 1],
    colors: const [
      Color(0xFFF2C2AD),
      Color(0xFFE98690),
      Color(0xFFE56981),
    ],
    transform: GradientRotation(3.14159),
  );
}
