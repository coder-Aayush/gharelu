import 'package:flutter/widgets.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';

extension WidgetX on Widget {
  Padding px(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );

  Padding py(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );

  Padding pOnly({
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  }) =>
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

  Expanded expanded({int flex = 1}) => Expanded(
        child: this,
        flex: flex,
      );


}

extension TextStyleX on TextStyle {
  //colors
  TextStyle get primary => copyWith(color: AppColors.primaryColor);
  TextStyle get white => copyWith(color: AppColors.whiteColor);
  TextStyle get softBlack => copyWith(color: AppColors.softBlack);
  TextStyle get midGrey => copyWith(color: AppColors.midGreyColor);

  TextStyle spacing(double value) =>
      copyWith(letterSpacing: calculateSpacing(value));
}
