import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/theme/theme.dart';


class GradientCircle extends StatelessWidget ***REMOVED***
  const GradientCircle(***REMOVED***
    Key? key,
    this.radius = 60,
    required this.child,
    this.borderWidth = 2.0,
    this.gradient = AppColors.circleGradient,
    this.showGradient = false,
  ***REMOVED***) : super(key: key);

  final double radius;
  final Widget child;
  final double borderWidth;
  final LinearGradient gradient;
  final bool showGradient;

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return Container(
      width: radius.w,
      height: radius.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: showGradient ? gradient : null,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(borderWidth),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            shape: BoxShape.circle,
          ),
          child: child,
        ),
      ),
    );
  ***REMOVED***
***REMOVED***
