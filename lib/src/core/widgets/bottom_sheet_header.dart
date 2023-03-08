import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    Key? key,
    required this.title,
    this.onClose,
    this.padding,
    this.onBackPressed,
    this.showClose = true,
    this.trailing,
    this.leading,
    this.closeText,
    this.isActionIconEnabled = false,
  }) : super(key: key);
  final String title;
  final Function()? onClose;
  final EdgeInsetsGeometry? padding;
  final Function()? onBackPressed;
  final bool showClose;
  final Widget? trailing;
  final Widget? leading;
  final String? closeText;
  final bool isActionIconEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(right: 10.w),
      child: Row(
        children: [
          Expanded(child: Container()),
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: AppStyles.text18PxMedium.softBlack,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(enableFeedback: true),
              onPressed: () {
                if (onClose != null) {
                  onClose?.call();
                } else {
                  Navigator.pop(context);
                }
              },
              child: Text(
                closeText ?? 'Close',
                style: AppStyles.text14PxMedium.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  
}
