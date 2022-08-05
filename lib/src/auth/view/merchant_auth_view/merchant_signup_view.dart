import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';

class MerchantSignupView extends StatelessWidget {
  const MerchantSignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup as Merchant'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Text(
              'Welcome! \nCreate an Account',
              style: AppStyles.text24PxBold,
            ),
            20.verticalSpace,
            CustomTextField(
              title: 'Name',
              controller: TextEditingController(),
            ),
            20.verticalSpace,
            CustomTextField(
              title: 'Email',
              controller: TextEditingController(),
            ),
            20.verticalSpace,
            CustomTextField(
              title: 'Phone Number',
              controller: TextEditingController(),
            ),
            20.verticalSpace,
            CustomTextField(
              title: 'Password',
              controller: TextEditingController(),
            ),
            20.verticalSpace,
            Text(
              'Company Registration or Citizenship photo',
              style: AppStyles.text14PxRegular.midGrey,
            ),
            ActionChip(
              label: const Text('Upload'),
              onPressed: () {},
            ),
            20.verticalSpace,
            Text(
              'Location',
              style: AppStyles.text14PxRegular.midGrey,
            ),
            ActionChip(
              label: const Text('Set on Map'),
              onPressed: () {},
            ),
            40.verticalSpace,
            Align(
              child: CustomButton(
                onPressed: () {},
                title: 'Sign Up',
                isDisabled: false,
              ),
            ),
            40.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have account? ',
                  style: AppStyles.text14PxRegular.midGrey,
                ),
                TextButton(
                  onPressed: () =>
                      context.router.push(const MerchantLoginRoute()),
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ).px(20),
    );
  }
}
