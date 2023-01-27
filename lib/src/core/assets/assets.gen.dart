***REMOVED***GENERATED CODE - DO NOT MODIFY BY HAND
***REMOVED********************************************************
***REMOVED*** FlutterGen
***REMOVED********************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class $AssetsIconsGen ***REMOVED***
  const $AssetsIconsGen();

  ***REMOVED***File path: assets/icons/chat.svg
  SvgGenImage get chat => const SvgGenImage('assets/icons/chat.svg');

  ***REMOVED***File path: assets/icons/clock_icon.svg
  SvgGenImage get clockIcon => const SvgGenImage('assets/icons/clock_icon.svg');

  ***REMOVED***File path: assets/icons/delete_icon.svg
  SvgGenImage get deleteIcon =>
      const SvgGenImage('assets/icons/delete_icon.svg');

  ***REMOVED***File path: assets/icons/hand_watch_icon.svg
  SvgGenImage get handWatchIcon =>
      const SvgGenImage('assets/icons/hand_watch_icon.svg');

  ***REMOVED***File path: assets/icons/khalti_logo.svg
  SvgGenImage get khaltiLogo =>
      const SvgGenImage('assets/icons/khalti_logo.svg');

  ***REMOVED***File path: assets/icons/location_marker.svg
  SvgGenImage get locationMarker =>
      const SvgGenImage('assets/icons/location_marker.svg');

  ***REMOVED***File path: assets/icons/phone.svg
  SvgGenImage get phone => const SvgGenImage('assets/icons/phone.svg');

  ***REMOVED***File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  ***REMOVED***List of all assets
  List<SvgGenImage> get values => [
        chat,
        clockIcon,
        deleteIcon,
        handWatchIcon,
        khaltiLogo,
        locationMarker,
        phone,
        search
      ];
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

  ***REMOVED***File path: assets/images/market.png
  AssetGenImage get market => const AssetGenImage('assets/images/market.png');

  ***REMOVED***File path: assets/images/user_avatar.png
  AssetGenImage get userAvatar =>
      const AssetGenImage('assets/images/user_avatar.png');

  ***REMOVED***File path: assets/images/welcome.png
  AssetGenImage get welcome => const AssetGenImage('assets/images/welcome.png');

  ***REMOVED***List of all assets
  List<AssetGenImage> get values =>
      [babr, esewaLogo, logo, map, market, userAvatar, welcome];
***REMOVED***

class $AssetsLottieGen ***REMOVED***
  const $AssetsLottieGen();

  ***REMOVED***File path: assets/lottie/error.json
  LottieGenImage get error => const LottieGenImage('assets/lottie/error.json');

  ***REMOVED***File path: assets/lottie/loader.json
  LottieGenImage get loader =>
      const LottieGenImage('assets/lottie/loader.json');

  ***REMOVED***File path: assets/lottie/not_found.json
  LottieGenImage get notFound =>
      const LottieGenImage('assets/lottie/not_found.json');

  ***REMOVED***List of all assets
  List<LottieGenImage> get values => [error, loader, notFound];
***REMOVED***

class Assets ***REMOVED***
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
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

  ImageProvider provider() => AssetImage(_assetName);

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

  String get keyName => _assetName;
***REMOVED***

class LottieGenImage ***REMOVED***
  const LottieGenImage(this._assetName);

  final String _assetName;

  LottieBuilder lottie(***REMOVED***
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  ***REMOVED***) ***REMOVED***
    return Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  ***REMOVED***

  String get path => _assetName;

  String get keyName => _assetName;
***REMOVED***
