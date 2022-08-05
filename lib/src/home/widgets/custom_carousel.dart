import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        100,
        (index) => ClipRRect(
          borderRadius: BorderRadius.circular(5.r),
          child: const CacheImageViewer(
            imageUrl: 'https://via.placeholder.com/300',
            width: double.infinity,
          ),
        ).px(5.w),
      ),
      options: CarouselOptions(
        aspectRatio: 23 / 10,
        autoPlay: true,
        viewportFraction: 0.8,
      ),
    );
  }
}
