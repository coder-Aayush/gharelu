import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';

class MerchantLoginView extends StatelessWidget ***REMOVED***
  const MerchantLoginView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login as Merchant'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.verticalSpace,
            Text(
              'Here To Get \nWelcome!',
              style: AppStyles.text24PxBold,
            ),
            30.verticalSpace,
            CustomTextField(
              title: 'Email',
              controller: TextEditingController(),
            ),
            22.verticalSpace,
            CustomTextField(
              title: 'Password',
              isPassword: true,
              controller: TextEditingController(),
            ),
            40.verticalSpace,
            Align(
              child: CustomButton(
                onPressed: () => context.router.push(
                  WelcomeRoute(
                    buttonTitle: 'Register your service',
                    onPressed: () ***REMOVED******REMOVED***,
                  ),
                ),
                title: 'Sign in',
                isDisabled: false,
              ),
            ),
            40.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have account?',
                  style: AppStyles.text14PxRegular.midGrey,
                ),
                TextButton(
                  onPressed: () => context.router.pop(),
                  child: const Text('Sign Up'),
                ),
        ***REMOVED***
            ),
    ***REMOVED***
        ),
      ).px(20),
    );
  ***REMOVED***
***REMOVED***
