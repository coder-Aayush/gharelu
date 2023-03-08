import 'package:flutter/material.dart';
import 'package:gharelu/src/core/theme/theme.dart';

Future<T?> showAppBottomSheet<T>(
  BuildContext context,
  Widget child, {
  AnimationController? animation,
  TickerProvider? vsync,
  bool enableDrag = true,
  Color backgroundColor = AppColors.whiteColor,
  double borderRadius = 8,
  VoidCallback? onComplete,
***REMOVED***) async {
  final response = await showModalBottomSheet<T>(
    backgroundColor: backgroundColor,
    context: context,
    builder: (context) => child,
    isScrollControlled: true,
    useRootNavigator: true,
    enableDrag: enableDrag,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius),
        topRight: Radius.circular(borderRadius),
      ),
    ),
  );
  return response;
***REMOVED***
