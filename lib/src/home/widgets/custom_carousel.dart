import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/models/banner_model.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({Key? key, required this.banners***REMOVED***) : super(key: key);

  final List<BannerModel> banners;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        banners.length,
        (index) => ClipRRect(
          borderRadius: BorderRadius.circular(5.r),
          child: CacheImageViewer(
            imageUrl: banners[index].imageUrl,
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
  ***REMOVED***
***REMOVED***
