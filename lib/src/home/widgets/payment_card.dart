import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';

class PaymentCard extends StatelessWidget ***REMOVED***
  const PaymentCard(***REMOVED***
    Key? key,
    required this.onPressed,
    required this.title,
    required this.icon,
    this.titleColor,
  ***REMOVED***) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final Widget icon;
  final Color? titleColor;

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return Material(
      color: AppColors.transparent,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.midWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                icon,
                12.horizontalSpace,
                Text(
                  title,
                  style: AppStyles.text18PxBold
                      .copyWith(color: titleColor ?? const Color(0xff5D2E8E)),
                ),
        ***REMOVED***
            ),
          ),
        ),
      ),
    );
  ***REMOVED***
***REMOVED***
