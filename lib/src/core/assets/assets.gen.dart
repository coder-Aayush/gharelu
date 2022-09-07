***REMOVED***GENERATED CODE - DO NOT MODIFY BY HAND
***REMOVED********************************************************
***REMOVED*** FlutterGen
***REMOVED********************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen ***REMOVED***
  const $AssetsIconsGen();

  ***REMOVED***File path: assets/icons/khalti_logo.svg
  SvgGenImage get khaltiLogo =>
      const SvgGenImage('assets/icons/khalti_logo.svg');

  ***REMOVED***File path: assets/icons/location_marker.svg
  SvgGenImage get locationMarker =>
      const SvgGenImage('assets/icons/location_marker.svg');

  ***REMOVED***File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');
***REMOVED***

class $AssetsImagesGen ***REMOVED***
  const $AssetsImagesGen();

  ***REMOVED***File path: assets/images/babr.png
  AssetGenImage get babr => const AssetGenImage('assets/images/babr.png');

  ***REMOVED***File path: assets/images/esewa_logo.png
  AssetGenImage get esewaLogo =>
      const AssetGenImage('assets/images/esewa_logo.png');

  ***REMOVED***File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  ***REMOVED***File path: assets/images/map.png
  AssetGenImage get map => const AssetGenImage('assets/images/map.png');

  ***REMOVED***File path: assets/images/welcome.png
  AssetGenImage get welcome => const AssetGenImage('assets/images/welcome.png');
***REMOVED***

class Assets ***REMOVED***
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
***REMOVED***

class AssetGenImage ***REMOVED***
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image(***REMOVED***
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  ***REMOVED***) ***REMOVED***
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  ***REMOVED***

  String get path => _assetName;

  String get keyName => _assetName;
***REMOVED***

class SvgGenImage ***REMOVED***
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg(***REMOVED***
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  ***REMOVED***) ***REMOVED***
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  ***REMOVED***

  String get path => _assetName;
***REMOVED***
