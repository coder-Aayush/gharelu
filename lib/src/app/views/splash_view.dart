import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
***REMOVED***
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/app/provider/auth_status_provider.dart';
import 'package:gharelu/src/auth/models/custom_user_model.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/services/notification_service.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashView extends HookConsumerWidget ***REMOVED***
  const SplashView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context, WidgetRef ref) ***REMOVED***
    // useEffect(() ***REMOVED***
    //   NotificationService.instance.initilize();
    //   if (ref.read(firebaseAuthProvider).currentUser != null) ***REMOVED***
    //     context.router.replaceAll([const DashboardRouter()]);
    //   ***REMOVED***
    // ***REMOVED***, []);
    ref.listen<AppState<CustomUserModel>>(authStatusNotifierProvider,
        (previous, next) ***REMOVED***
      next.maybeWhen(
        orElse: () => null,
        success: (data) ***REMOVED***
          context.showSnackbar(message: 'Welcome Back $***REMOVED***data.name***REMOVED***');
          if (data.isMerchant) ***REMOVED***
            ***REMOVED***navigate to merchant
            ///
            context.router.replaceAll([const MerchantDashboardRouter()]);
          ***REMOVED*** else ***REMOVED***
            context.router.replaceAll([const DashboardRouter()]);
          ***REMOVED***
        ***REMOVED***,
        error: (message) async ***REMOVED***
          context.showSnackbar(message: message);
          // ignore: inference_failure_on_instance_creation
          await Future.delayed(const Duration(milliseconds: 300));
          context.router.push(const LoginChoiceRoute());
        ***REMOVED***,
      );
  ***REMOVED***

    // ref.listen(authSatate, (previous, next) ***REMOVED***
    //   if (next != null) ***REMOVED***
    //     log(next.toString());
    //   ***REMOVED***
    // ***REMOVED***);
    // final _authState = ref.watch(authSatate);
    // return Scaffold(
    //   backgroundColor: AppColors.primaryColor,
    //   body: _authState.when(
    //     data: (data) ***REMOVED***
    //       if (data != null) ***REMOVED***
    //         context.router.replaceAll([const DashboardRouter()]);
    //       ***REMOVED***
    //       return _body(context);
    //     ***REMOVED***,
    //     error: (message, _) => _body(context),
    //     loading: () => _body(context),
    //   ),
    // );
    return ScaffoldWrapper(
      backgroundColor: AppColors.primaryColor,
      body: _body(context),
    );
  ***REMOVED***

  Widget _body(BuildContext context) ***REMOVED***
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Assets.images.logo.image(),
            const Spacer(),
            Text(
              'Have a Problem \nyou cannot solve?\nDon\'t worry. Lets Get started',
              textAlign: TextAlign.center,
              style: AppStyles.text18PxMedium.white,
            ),
            const Spacer(),
            Consumer(builder: (context, ref, _) ***REMOVED***
              return ref.watch(authStatusNotifierProvider).maybeWhen(
                    orElse: () => buildButton(ref, context),
                    success: (data) ***REMOVED***
                      return const SizedBox.shrink();
                    ***REMOVED***,
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    error: (message) => buildButton(ref, context),
                  );
            ***REMOVED***),
            20.verticalSpace,
    ***REMOVED***
        ),
      ),
    );
  ***REMOVED***

  Widget buildButton(WidgetRef ref, BuildContext context) ***REMOVED***
    return CustomButton(
      loading: ref.watch(authStatusNotifierProvider).maybeWhen(
            orElse: () => false,
            loading: () => true,
          ),
      title: 'Get Started',
      onPressed: () => context.router.push(const LoginChoiceRoute()),
      isDisabled: false,
      backgroundColor: AppColors.whiteColor,
      titleStyle: AppStyles.text14PxMedium.softBlack,
      width: 270,
    );
  ***REMOVED***
***REMOVED***
