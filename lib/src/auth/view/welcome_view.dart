import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';

@RoutePage()
class WelcomeView extends StatelessWidget {
  const WelcomeView(
      {Key? key, required this.onPressed, required this.buttonTitle})
      : super(key: key);
  final VoidCallback onPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Assets.images.welcome.image(),
              20.verticalSpace,
              Text('Welcome!', style: AppStyles.text30PxBold.softBlack),
              const Spacer(),
              Text(
                'Have a Problem \nyou cannot solve?\nDon\'t worry. Lets Get started',
                textAlign: TextAlign.center,
                style: AppStyles.text18PxMedium.midGrey,
              ),
              const Spacer(),
              CustomButton(
                title: buttonTitle,
                isDisabled: false,
                width: 270.w,
                onPressed: () async {
                  onPressed();
                },
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
