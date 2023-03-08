import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';

class IncrementAndDecrement extends StatelessWidget {
  const IncrementAndDecrement(
      {Key? key,
      required this.count,
      required this.onIncrement,
      required this.onDecrement})
      : super(key: key);
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.softBlue,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: AppColors.transparent,
            child: InkWell(
              onTap: onDecrement,
              child: Icon(
                Icons.remove,
                color: const Color(0xff707070),
                size: 20.sp,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: AppColors.primaryColor,
            ),
            child: Text(
              '$count',
              style: AppStyles.text14PxMedium.white,
            ),
          ),
          Material(
            color: AppColors.transparent,
            child: InkWell(
              onTap: onIncrement,
              child: Icon(
                Icons.add,
                color: const Color(0xff707070),
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
