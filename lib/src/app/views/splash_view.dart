import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Assets.images.logo.image(),
              const Spacer(),
              Text(
                'Have a Problem you cannot solve?Don\'t worry. Lets Get started',
                textAlign: TextAlign.center,
                style: AppStyles.text18PxMedium.white,
              ),
              const Spacer(),
              CustomButton(
                title: 'Get Started',
                onPressed: () => context.router.push(const LoginChoiceRoute()),
                isDisabled: false,
                backgroundColor: AppColors.whiteColor,
                titleStyle: AppStyles.text14PxMedium.softBlack,
                width: 270,
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
