import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';

class CacheImageViewer extends StatelessWidget ***REMOVED***
  const CacheImageViewer(
      ***REMOVED***Key? key, this.imageUrl, this.height, this.width, this.fit***REMOVED***)
      : super(key: key);
  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      progressIndicatorBuilder: (_, url, downloadProgress) ***REMOVED***
        return url.isEmpty
            ? Image.asset(Assets.images.logo.path, fit: BoxFit.cover)
            : context.loader;
      ***REMOVED***,
      errorWidget: (context, url, error) => const Icon(Icons.error_outline),
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
    );
  ***REMOVED***
***REMOVED***
