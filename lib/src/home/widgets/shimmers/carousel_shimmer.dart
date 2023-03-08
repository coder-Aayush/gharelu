import 'package:flutter/material.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:velocity_x/velocity_x.dart';

class CarouselShimmer extends StatelessWidget {
  const CarouselShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxShimmer(
      child: AspectRatio(
        aspectRatio: 23 / 10,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.midGreyColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
