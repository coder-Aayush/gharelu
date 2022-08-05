import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
***REMOVED***
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';

class AppView extends StatelessWidget ***REMOVED***
  AppView(***REMOVED***Key? key***REMOVED***) : super(key: key);
  final _router = AppRouter();
***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return ProviderScope(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          systemNavigationBarColor: AppColors.whiteColor,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          builder: (_, __) => MaterialApp.router(
            routerDelegate: _router.delegate(),
            routeInformationParser: _router.defaultRouteParser(),
            title: 'Gharelu',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                centerTitle: true,
                titleTextStyle: AppStyles.text20PxSemiBold.softBlack,
              ),
              useMaterial3: true,
              colorSchemeSeed: AppColors.primaryColor,
            ),
            builder: (context, child) => child!,
          ),
        ),
      ),
    );
  ***REMOVED***
***REMOVED***
