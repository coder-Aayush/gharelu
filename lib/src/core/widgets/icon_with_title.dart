import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';

class IconWithTitle extends StatelessWidget ***REMOVED***
  const IconWithTitle(***REMOVED***Key? key, required this.icon, required this.title***REMOVED***)
      : super(key: key);
  final String icon;
  final String title;

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon, color: AppColors.primaryColor, height: 15),
          3.horizontalSpace,
          Text(title, style: AppStyles.text12PxMedium.primary),
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***