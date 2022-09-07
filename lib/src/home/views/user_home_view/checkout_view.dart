import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';

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
                onPressed: () ***REMOVED******REMOVED***,
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
