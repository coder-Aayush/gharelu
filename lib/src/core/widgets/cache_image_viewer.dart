import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';

class CacheImageViewer extends StatelessWidget ***REMOVED***
  const CacheImageViewer(
      ***REMOVED***Key? key,
      required this.imageUrl,
      this.height,
      this.width,
      this.petType,
      this.fit***REMOVED***)
      : super(key: key);
  final String imageUrl;
  final int? petType;
  final double? height;
  final double? width;
  final BoxFit? fit;

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (_, url, downloadProgress) ***REMOVED***
        return url.isEmpty
            ? Image.asset(Assets.images.logo.path, fit: BoxFit.cover)
            : CircularProgressIndicator(value: downloadProgress.progress);
      ***REMOVED***,
      // placeholder: (_, url) => placeholderImage.isNotNullNotEmpty
      //     ? Image.asset(
      //         placeholderImage!,
      //         fit: BoxFit.cover,
      //       )
      //     : Shimmer.fromColors(
      //         child: Container(
      //           height: 100.h,
      //           width: 100.h,
      //         ),
      //         baseColor: AppColors.greyColor,
      //         highlightColor: AppColors.whiteColor,
      //       ),
      // errorWidget: (_, __, ___) => placeholderImage.isNotNullNotEmpty
      //     ? Image.asset(
      //         placeholderImage!,
      //         fit: BoxFit.cover,
      //       )
      //     : Image.asset(AssetHelper.dogPlaceholderImage),
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
    );
  ***REMOVED***
***REMOVED***
