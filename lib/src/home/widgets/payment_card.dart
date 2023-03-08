import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
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

  BorderRadius get radius => BorderRadius.circular(8);
  ShapeBorder get _shape => RoundedRectangleBorder(borderRadius: radius);
  BoxConstraints get _constraints =>
      BoxConstraints.tightFor(width: double.infinity, height: 70.h);

  @override
  Widget build(BuildContext context) {
    // return Material(
    //   color: AppColors.transparent,
    //   child: Container(
    //     width: double.infinity,

    //     decoration: BoxDecoration(
    //       color: AppColors.midWhite,
    //       borderRadius: BorderRadius.circular(8),
    //     ),
    //     child: InkWell(
    //       borderRadius: BorderRadius.circular(8),
    //       onTap: onPressed,
    //     ),
    //   ),
    // );
    return Material(
      type: MaterialType.card,
      clipBehavior: Clip.antiAlias,
      color: AppColors.midWhite,
      shape: _shape,
      shadowColor: AppColors.softBlack,
      child: Container(
        child: InkWell(
          splashColor: (titleColor ?? AppColors.primaryColor).withOpacity(0.5),
          borderRadius: radius,
          onTap: () async {
            FocusScope.of(context).unfocus();
            await HapticFeedback.heavyImpact();
            onPressed.call();
          ***REMOVED***,
          child: ConstrainedBox(
            constraints: _constraints,
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
                ],
              ).pOnly(left: 20),
            ),
          ),
        ),
      ),
    );
  ***REMOVED***
***REMOVED***
