***REMOVED***

import 'package:flutter/material.dart';
***REMOVED***
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';

class SplashView extends ConsumerWidget ***REMOVED***
  const SplashView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context, WidgetRef ref) ***REMOVED***
    ref.listen(authSatate, (previous, next) ***REMOVED***
      if (next != null) ***REMOVED***
        log(next.toString());
      ***REMOVED***
  ***REMOVED***
    final _authState = ref.watch(authSatate);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: _authState.when(
        data: (data) ***REMOVED***
          if (data != null) ***REMOVED***
            context.router.replaceAll([const DashboardRouter()]);
          ***REMOVED***
          return _body(context);
        ***REMOVED***,
        error: (message, _) => _body(context),
        loading: () => _body(context),
      ),
    );
  ***REMOVED***

  Widget _body(BuildContext context) ***REMOVED***
    return SafeArea(
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
    ***REMOVED***
        ),
      ),
    );
  ***REMOVED***
***REMOVED***
