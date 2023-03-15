import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    Key? key,
    required this.onPressed,
    required this.image,
    this.discount,
    required this.name,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String image;
  final int? discount;
  final String name;

  BorderRadius get radius => BorderRadius.circular(8.r);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: radius,
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Material(
        borderRadius: radius,
        child: InkWell(
          onTap: onPressed,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    image.isNotEmpty
                        ? CacheImageViewer(
                            imageUrl: image,
                            fit: BoxFit.cover,
                            height: 100.h,
                          )
                        : Assets.images.babr.image(),
                    const Spacer(),
                    Text(
                      name,
                      style: AppStyles.text18PxMedium.primary,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              if (discount != null && discount != 0)
                Positioned(
                  top: -10,
                  left: -10,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: Center(
                      child: Text(
                        '$discount%',
                        style: AppStyles.text14PxBold.white,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
