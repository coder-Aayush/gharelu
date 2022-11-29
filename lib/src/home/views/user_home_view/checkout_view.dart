***REMOVED***

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class CheckoutView extends StatelessWidget ***REMOVED***
  const CheckoutView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return ScaffoldWrapper(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const AutoLeadingButton(color: AppColors.whiteColor),
            backgroundColor: AppColors.primaryColor,
            title: Text(
              'Confirm Booking',
              style: AppStyles.text20PxBold.white,
            ),
            floating: true,
          ),
          Column(
            children: [
              10.verticalSpace,
              PaymentCard(
                title: 'Pay with Khalti',
                onPressed: () async ***REMOVED***
                  final config = PaymentConfig(
                    amount: 10000, // Amount should be in paisa
                    productIdentity: 'dell-g5-g5510-2021',
                    productName: 'Dell G5 G5510 2021',
                  );
                  await KhaltiScope.of(context).pay(
                    config: config,
                    preferences: [
                      PaymentPreference.khalti,
                      PaymentPreference.mobileBanking,
              ***REMOVED***
                    onSuccess: (value) ***REMOVED***
                      log(value.toString());
                    ***REMOVED***,
                    onFailure: (value) ***REMOVED***
                      log(value.toString());
                    ***REMOVED***,
                  );
                ***REMOVED***,
                icon: Assets.icons.khaltiLogo.svg(height: 23.h),
              ),
              20.verticalSpace,
              PaymentCard(
                title: 'Pay with eSewa',
                icon: Assets.images.esewaLogo.image(height: 23.h),
                onPressed: () ***REMOVED******REMOVED***,
                titleColor: const Color(0xff60BB47),
              ),
      ***REMOVED***
          ).px(20).toSliverBox
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***
