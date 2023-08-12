import 'package:auto_route/auto_route.dart';
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

@RoutePage(name: 'ProfileRouter')
class ProfileView extends StatefulHookConsumerWidget {
  const ProfileView({Key? key, required this.onAppoinment}) : super(key: key);
  final VoidCallback onAppoinment;

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      ref.listen<AppState>(logoutStateNotifierProvider, (previous, next) {
        next.maybeWhen(
          orElse: () => null,
          success: (data) {
            context.router.replaceAll([const SplashRoute()]);
            ref.invalidate(getUserInfoNotifiderProvider);
          },
          error: (message) {
            context.showSnackbar(message: message);
          },
        );
      });
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
              child: Consumer(builder: (context, ref, _) {
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
                          ],
                        ),
                      ),
                    );
              }),
            ),
            Column(
              children: [
                // 30.verticalSpace,
                // CardListTile(
                //   title: 'View Profile',
                //   onPressed: () {},
                // ),
                30.verticalSpace,
                CardListTile(
                  title: 'Appointments',
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
                  builder: (context, ref, _) {
                    return CardListTile(
                      title: 'Logout',
                      onPressed: () => ref.read(logoutStateNotifierProvider.notifier).logout(),
                    );
                  },
                ),
              ],
            ).px(20.w),
          ],
        ),
      );
    });
  }
}
