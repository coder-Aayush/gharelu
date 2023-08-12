import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: (150.h / 2).h),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
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
              onTap: onPressed,
              child: Row(
                children: [
                  Assets.icons.search
                      .svg(
                        height: 25,
                        colorFilter: const ColorFilter.mode(
                          AppColors.midGreyColor,
                          BlendMode.srcIn,
                        ),
                      )
                      .px(5),
                  6.horizontalSpace,
                  Text(
                    'Search Services',
                    style: AppStyles.text14PxRegular.midGrey,
                  ).expanded(),
                ],
              ).px(10),
            ),
          ),
        ).px(20),
      ),
    );
  }
}
