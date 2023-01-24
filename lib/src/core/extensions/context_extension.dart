import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';
import 'package:gharelu/src/core/widgets/animated_dialog.dart';
import 'package:lottie/lottie.dart';

extension ContextX on BuildContext ***REMOVED***
  //width & height
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
***REMOVED***

extension WidgetX on BuildContext ***REMOVED***
  void showSnackbar(***REMOVED***
    required String message,
  ***REMOVED***) ***REMOVED***
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: AppColors.softBlack,
          content: Text(
            message,
            style: AppStyles.text14PxRegular.white,
          ),
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.horizontal,
          duration: const Duration(seconds: 3),
        ),
      );
  ***REMOVED***

  void showErorDialog(
      ***REMOVED***required String? message,
      VoidCallback? buttonPressed,
      String? buttonTitle***REMOVED***) ***REMOVED***
    showGeneralDialog(
      context: this,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, _, __) => AlertDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 150.h,
              width: 200.w,
              child: LottieBuilder.asset(
                Assets.lottie.error,
                fit: BoxFit.cover,
                height: 150.h,
              ),
            ),
            20.verticalSpace,
            Text(
              'Ops! An Error Occured',
              style: AppStyles.text18PxBold.softBlack,
              textAlign: TextAlign.center,
            ),
            6.verticalSpace,
            if (message != null)
              Text(
                message,
                style: AppStyles.text14PxRegular
                    .copyWith(color: AppColors.softBlack.withOpacity(.5)),
                textAlign: TextAlign.center,
              ),
    ***REMOVED***
        ),
        actions: [
          TextButton(
            onPressed: () ***REMOVED***
              if (buttonPressed != null) ***REMOVED***
                buttonPressed.call();
              ***REMOVED*** else ***REMOVED***
                Navigator.pop(context);
              ***REMOVED***
            ***REMOVED***,
            child: Text(buttonTitle ?? 'Ok'),
          ),
  ***REMOVED***
      ),
    );
  ***REMOVED***

  Widget get loader => Center(
        child: SizedBox(
          child: Lottie.asset(Assets.lottie.loader),
          height: 150.h,
          width: 150.w,
        ),
      );
***REMOVED***
