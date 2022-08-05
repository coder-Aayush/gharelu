import 'package:flutter/widgets.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';

extension WidgetX on Widget ***REMOVED***
  Padding px(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );

  Padding py(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );

  Padding pOnly(***REMOVED***
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  ***REMOVED***) =>
      Padding(
        padding: EdgeInsets.only(
          top: top,
          right: right,
          bottom: bottom,
          left: left,
        ),
        child: this,
      );

  Padding pad(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Align get centerLeft => Align(
        child: this,
        alignment: Alignment.centerLeft,
      );

  SliverToBoxAdapter get toSliverBox => SliverToBoxAdapter(child: this);

  Expanded expanded(***REMOVED***int flex = 1***REMOVED***) => Expanded(
        child: this,
        flex: flex,
      );


***REMOVED***

extension TextStyleX on TextStyle ***REMOVED***
  //colors
  TextStyle get primary => copyWith(color: AppColors.primaryColor);
  TextStyle get white => copyWith(color: AppColors.whiteColor);
  TextStyle get softBlack => copyWith(color: AppColors.softBlack);
  TextStyle get midGrey => copyWith(color: AppColors.midGreyColor);
  TextStyle get error => copyWith(color: AppColors.errorColor);

  TextStyle spacing(double value) =>
      copyWith(letterSpacing: calculateSpacing(value));
***REMOVED***
