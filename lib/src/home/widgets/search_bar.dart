import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';

class SearchBar extends StatelessWidget ***REMOVED***
  const SearchBar(***REMOVED***Key? key, required this.onPressed***REMOVED***) : super(key: key);

  final VoidCallback onPressed;

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return Container(
      padding: EdgeInsets.only(top: (150.h / 2).h),
      height: 150.h,
      child: Center(
        child: Container(
          height: 45.h,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(6.r),
          ),
          width: double.infinity,
          child: Material(
            borderRadius: BorderRadius.circular(6.r),
            child: InkWell(
              borderRadius: BorderRadius.circular(6.r),
              onTap: () ***REMOVED******REMOVED***,
              child: Row(
                children: [
                  Assets.icons.search
                      .svg(color: AppColors.softBlack, height: 25)
                      .px(5),
                  6.horizontalSpace,
                  Text(
                    'Search Services',
                    style: AppStyles.text14PxRegular.midGrey,
                  ).expanded(),
          ***REMOVED***
              ).px(10),
            ),
          ),
        ).px(20),
      ),
    );
  ***REMOVED***
***REMOVED***
