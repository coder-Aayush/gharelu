import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/auth/providers/logout_provider.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
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

class ProfileView extends StatefulHookConsumerWidget ***REMOVED***
  const ProfileView(***REMOVED***Key? key, required this.onAppoinment***REMOVED***) : super(key: key);
  final VoidCallback onAppoinment;

***REMOVED***
  _ProfileViewState createState() => _ProfileViewState();
***REMOVED***

class _ProfileViewState extends ConsumerState<ProfileView> ***REMOVED***
***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return Consumer(builder: (context, ref, _) ***REMOVED***
      ref.listen<AppState>(logoutStateNotifierProvider, (previous, next) ***REMOVED***
        next.maybeWhen(
          orElse: () => null,
          success: (data) ***REMOVED***
            context.router.replaceAll([const SplashRoute()]);
            ref.invalidate(getUserInfoNotifiderProvider);
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
                      orElse: Container.new,
                      error: (message) => Text(message),
                      success: (data) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GradientCircle(
                              child: CacheImageViewer(
                                imageUrl: '',
                                error: (context, url, error) => Assets.images.userAvatar.image(fit: BoxFit.cover),
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              data.name,
                              style: AppStyles.text14PxSemiBold.white,
                            ),
                            4.verticalSpace,
                            Text(
                              data.email,
                              style: AppStyles.text10PxMedium.white,
                            )
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
                  onPressed: widget.onAppoinment,
                ),
                20.verticalSpace,
                CardListTile(
                  title: 'Delete Account',
                  onPressed: () => DeleteAccountBottomsheet.show(context),
                ),
                20.verticalSpace,
                CardListTile(
                  title: 'Customer Support',
                  onPressed: () => context.router.push(const HelpAndSupportRoute()),
                ),
                20.verticalSpace,
                Consumer(
                  builder: (context, ref, _) ***REMOVED***
                    return CardListTile(
                      title: 'Logout',
                      onPressed: () => ref.read(logoutStateNotifierProvider.notifier).logout(),
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
