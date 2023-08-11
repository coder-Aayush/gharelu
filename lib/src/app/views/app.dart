import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/main.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class AppView extends StatelessWidget {
  AppView({Key? key}) : super(key: key);
  final _router = getIt<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: dotenv.env['KHALTI_PUBLIC_KEY'] as String,
      enabledDebugging: true,
      navigatorKey: _router.navigatorKey,
      builder: (_, navigatorState) => ProviderScope(
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
              localizationsDelegates: const [KhaltiLocalizations.delegate],
              debugShowCheckedModeBanner: false,
              routerDelegate: _router.delegate(),
              routeInformationParser: _router.defaultRouteParser(),
              title: 'Gharelu',
              theme: ThemeData(
                useMaterial3: true,
                appBarTheme: AppBarTheme(
                  centerTitle: true,
                  titleTextStyle: AppStyles.text20PxSemiBold.softBlack,
                ),
                // useMaterial3: true,
                colorSchemeSeed: AppColors.primaryColor,
              ),
              builder: (context, child) => child!,
            ),
          ),
        ),
      ),
    );
  }
}
