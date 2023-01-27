import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:lottie/lottie.dart';

class NoDataFound extends StatelessWidget ***REMOVED***
  const NoDataFound(***REMOVED***Key? key, required this.title, required this.onRefresh***REMOVED***) : super(key: key);
  final String title;
  final VoidCallback onRefresh;
***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          Assets.lottie.notFound.path,
          height: 220.h,
        ),
        Text(title, style: AppStyles.text20PxMedium),
        30.verticalSpace,
        CustomButton(
          title: 'Retry',
          onPressed: onRefresh,
          isDisabled: false,
        )
***REMOVED***
    );
  ***REMOVED***
***REMOVED***
