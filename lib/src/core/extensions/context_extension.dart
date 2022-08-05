import 'package:flutter/material.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';

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
***REMOVED***
