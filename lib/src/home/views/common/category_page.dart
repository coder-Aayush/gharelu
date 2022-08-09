import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';

class CategoryView extends StatelessWidget ***REMOVED***
  const CategoryView(***REMOVED***Key? key, required this.title***REMOVED***) : super(key: key);

  final String title;
***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return ScaffoldWrapper(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const AutoLeadingButton(color: AppColors.whiteColor),
            backgroundColor: AppColors.primaryColor,
            title: Row(
              children: [
                Assets.icons.locationMarker
                    .svg(color: AppColors.whiteColor, height: 30),
                10.horizontalSpace,
                Text('Kathmandu, Nepal', style: AppStyles.text18PxBold.white)
                    .expanded()
        ***REMOVED***
            ),
            expandedHeight: 150.h,
            snap: true,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: SearchBar(
                onPressed: () ***REMOVED******REMOVED***,
              ),
            ),
          ),
          20.verticalSpace.toSliverBox,
          Text(title, style: AppStyles.text24PxBold.primary).px(10).toSliverBox,
          60.verticalSpace.toSliverBox,
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.h,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => CustomProductCard(
                onPressed: () ***REMOVED******REMOVED***,
              ).px(10.w),
              childCount: 100,
            ),
          ),
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***
