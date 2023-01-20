import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/auth/providers/logout_provider.dart';
import 'package:gharelu/src/auth/view/user_auth_view/login_user_view.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/providers/get_user_info_provider.dart';
import 'package:gharelu/src/home/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileView extends StatelessWidget ***REMOVED***
  const ProfileView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return Consumer(builder: (context, ref, _) ***REMOVED***
      ref.listen<AppState>(logoutStateNotifierProvider, (previous, next) ***REMOVED***
        next.maybeWhen(
          orElse: () => null,
          success: (data) ***REMOVED***
            context.router.replaceAll([const LoginUserRoute()]);
          ***REMOVED***,
          error: (message) ***REMOVED***
            context.showSnackbar(message: message);
          ***REMOVED***,
        );
    ***REMOVED***
      return ScaffoldWrapper(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text('Profile', style: AppStyles.text16PxSemiBold.white),
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .2,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4.0),
                  bottomRight: Radius.circular(4.0),
                ),
              ),
              child: Consumer(builder: (context, ref, _) ***REMOVED***
                return ref.watch(getUserInfoNotifiderProvider).maybeWhen(
                      orElse: () => Container(),
                      success: (data) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const GradientCircle(
                              child: CacheImageViewer(
                                imageUrl:
                                    'https://w7.pngwing.com/pngs/754/2/png-transparent-samsung-galaxy-a8-a8-user-login-telephone-avatar-pawn-blue-angle-sphere-thumbnail.png',
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              data.name,
                              style: AppStyles.text14PxSemiBold.white,
                            ),
                    ***REMOVED***
                        ),
                      ),
                    );
              ***REMOVED***),
            ),
            Column(
              children: [
                // 30.verticalSpace,
                // CardListTile(
                //   title: 'View Profile',
                //   onPressed: () ***REMOVED******REMOVED***,
                // ),
                30.verticalSpace,
                CardListTile(
                  title: 'Appoinments',
                  onPressed: () =>
                      context.router.root.innerRouterOf(DashboardRouter.name)
                        ?..innerRouterOf<TabsRouter>(DashboardRouter.name)
                            ?.setActiveIndex(1)
                        ..navigate(const AppointmentRouter()),
                ),
                20.verticalSpace,
                CardListTile(
                  title: 'Delete Account',
                  onPressed: () => DeleteAccountBottomsheet.show(context),
                ),
                20.verticalSpace,
                CardListTile(
                  title: 'Customer Support',
                  onPressed: () =>
                      context.router.push(const HelpAndSupportRoute()),
                ),
                20.verticalSpace,
                Consumer(
                  builder: (context, ref, _) ***REMOVED***
                    return CardListTile(
                      title: 'Logout',
                      onPressed: () => ref
                          .read(logoutStateNotifierProvider.notifier)
                          .logout(),
                    );
                  ***REMOVED***,
                ),
        ***REMOVED***
            ).px(20.w),
    ***REMOVED***
        ),
      );
  ***REMOVED***
  ***REMOVED***
***REMOVED***
