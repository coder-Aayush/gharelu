import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:lottie/lottie.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({Key? key, required this.title, required this.onRefresh}) : super(key: key);
  final String title;
  final VoidCallback onRefresh;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          Assets.lottie.notFound.path,
          height: 220.h,
        ),
        Text(title, style: AppStyles.text20PxMedium, textAlign: TextAlign.center),
        30.verticalSpace,
        CustomButton(
          title: 'Retry',
          onPressed: onRefresh,
          isDisabled: false,
        )
      ],
    );
  }
}
