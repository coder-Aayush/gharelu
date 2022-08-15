***REMOVED***

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';

class ProductView extends StatelessWidget ***REMOVED***
  const ProductView(
      ***REMOVED***Key? key,
      required this.categoryId,
      required this.serviceId,
      required this.image,
      required this.title***REMOVED***)
      : super(key: key);
  final String categoryId;
  final String serviceId;
  final String image;
  final String title;

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return ScaffoldWrapper(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const AutoLeadingButton(color: AppColors.whiteColor),
            backgroundColor: AppColors.primaryColor,
            title: Text(
              title,
              style: AppStyles.text20PxBold.white,
            ),
            floating: true,
            onStretchTrigger: () async ***REMOVED***
              log('refresh');
            ***REMOVED***,
          ),
          10.verticalSpace.toSliverBox,
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CacheImageViewer(
              imageUrl: image,
              height: 200.h,
            ),
          ).px(10).toSliverBox,
          20.verticalSpace.toSliverBox,
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ProductTile(
                name: 'Simple Hair Cut',
                description:
                    'Get hair cut at your home up to Hip size with styling',
                image:
                    'https://5.imimg.com/data5/GK/HF/GS/GLADMIN-54443168/selection-031-500x500.png',
                onDecrement: () ***REMOVED******REMOVED***,
                onIncrement: () ***REMOVED******REMOVED***,
                price: 800,
              ).px(10).py(14),
              childCount: 10,
            ),
          ),
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***
