***REMOVED***

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';

class IncrementAndDecrement extends StatelessWidget ***REMOVED***
  const IncrementAndDecrement(
      ***REMOVED***Key? key,
      required this.count,
      required this.onIncrement,
      required this.onDecrement***REMOVED***)
      : super(key: key);
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.softBlue,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: onIncrement,
            child: Icon(
              Icons.remove,
              color: const Color(0xff707070),
              size: 16.sp,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.primaryColor,
            ),
            child: Text(
              '$count',
              style: AppStyles.text14PxMedium.white,
            ),
          ),
          InkWell(
            onTap: onDecrement,
            child: Icon(
              Icons.add,
              color: const Color(0xff707070),
              size: 16.sp,
            ),
          ),
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***