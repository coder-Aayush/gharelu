***REMOVED***

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';

class ProductTile extends StatelessWidget ***REMOVED***
  final String image;
  final String name;
  final String description;
  final int price;
  final int max;
  final int itemInCart;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const ProductTile(***REMOVED***
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    this.max = 10,
    this.itemInCart = 0,
    required this.onIncrement,
    required this.onDecrement,
  ***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.softBlack.withOpacity(.4),
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r),
            ),
            child: CacheImageViewer(
              imageUrl: image,
              width: 160,
              height: 120,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: AppStyles.text16PxMedium),
              2.verticalSpace,
              Text(
                description,
                style: AppStyles.text12PxBold.midGrey,
                textAlign: TextAlign.left,
              ),
              Row(
                children: [
                  Text('Rs: $price', style: AppStyles.text14PxBold.primary),
                  const Spacer(),
                  IncrementAndDecrement(
                    count: 10,
                    onDecrement: () ***REMOVED******REMOVED***,
                    onIncrement: () ***REMOVED******REMOVED***,
                  ),
          ***REMOVED***
              ).pOnly(top: 16),
      ***REMOVED***
          ).px(12).expanded(),
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***
