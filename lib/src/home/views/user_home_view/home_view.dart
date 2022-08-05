import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.gr.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.primaryColor,
            title: Row(
              children: [
                Assets.icons.locationMarker
                    .svg(color: AppColors.whiteColor, height: 30),
                10.horizontalSpace,
                Text('Kathmandu, Nepal', style: AppStyles.text18PxBold.white)
                    .expanded()
              ],
            ),
            expandedHeight: 150.h,
            snap: true,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: SearchBar(
                onPressed: () {},
              ),
            ),
          ),
          20.verticalSpace.toSliverBox,
          const CustomCarousel().toSliverBox,
          30.verticalSpace.toSliverBox,
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.h,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => ProductCard(
                onPressed: () =>
                    context.router.push(CategoryRoute(title: 'Baby Sitting')),
              ).px(8.w),
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}
