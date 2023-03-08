import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/auth/providers/delete_user_provider.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/providers/get_user_info_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeleteAccountBottomsheet extends HookWidget {
  DeleteAccountBottomsheet({Key? key***REMOVED***) : super(key: key);

  final ValueNotifier<bool> askPassword = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final feedback = useTextEditingController();
    final password = useTextEditingController();
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      child: Consumer(builder: (context, ref, _) {
        ref.listen<AppState>(deleteUserProviderNotifierProvider,
            (previous, next) {
          next.maybeWhen(
            orElse: () => null,
            success: (data) {
              context.showSnackbar(message: 'Account Deleted');
              context.router.replaceAll([const SplashRoute()]);
            ***REMOVED***,
            error: (message) {
              print(message);
              context.showErorDialog(message: message);
            ***REMOVED***,
          );
        ***REMOVED***
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              10.verticalSpace,
              ValueListenableBuilder(
                valueListenable: askPassword,
                builder: (context, value, _) {
                  return BottomSheetHeader(
                    title: askPassword.value
                        ? 'Confirm Deletion'
                        : 'Delete Account?',
                  );
                ***REMOVED***,
              ),
              10.verticalSpace,
              Column(
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: askPassword,
                    builder: (context, value, child) {
                      if (value) {
                        return Column(
                          children: [
                            Text(
                              'Please Enter your password to Delete your Account at Gharelu App',
                              style: AppStyles.text14PxRegular.copyWith(
                                color: AppColors.softBlack.withOpacity(.6),
                              ),
                            ),
                            10.verticalSpace,
                            CustomTextField(
                              title: 'Enter Password',
                              controller: password,
                              isPassword: true,
                              maxLines: 1,
                              textInputType: TextInputType.visiblePassword,
                            ),
                          ],
                        );
                      ***REMOVED*** else {
                        return Column(
                          children: [
                            Text(
                              'We are very sad to know, you are leaving Gharelu App. We will Appricate if you leave Feedback or any Suugestion to Improve.',
                              style: AppStyles.text14PxRegular.copyWith(
                                color: AppColors.softBlack.withOpacity(.6),
                              ),
                            ),
                            10.verticalSpace,
                            TextField(
                              controller: feedback,
                              maxLines: 3,
                              decoration: InputDecoration(
                                hintText: 'Feedback (Optional)',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                    color: AppColors.primaryColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      ***REMOVED***
                    ***REMOVED***,
                  ),
                  30.verticalSpace,
                  Row(
                    children: [
                      CustomButton(
                        title: 'Delete',
                        loading: ref
                            .watch(deleteUserProviderNotifierProvider)
                            .maybeWhen(
                              orElse: () => false,
                              loading: () => true,
                            ),
                        onPressed: () {
                          if (!askPassword.value) {
                            askPassword.value = true;
                          ***REMOVED*** else {
                            final isMerchant = ref
                                .watch(getUserInfoNotifiderProvider)
                                .maybeWhen(
                                  orElse: () => false,
                                  success: (data) =>
                                      data.isMerchant ? true : false,
                                );
                            ref
                                .read(
                                    deleteUserProviderNotifierProvider.notifier)
                                .deleteUser(
                                  message: feedback.text,
                                  password: password.text,
                                  isMerchant: isMerchant,
                                );
                          ***REMOVED***
                        ***REMOVED***,
                        backgroundColor: AppColors.errorColor,
                        isDisabled: false,
                      ),
                      const Spacer(),
                      CustomButton(
                        title: 'Cancel',
                        onPressed: () => Navigator.pop(context),
                        backgroundColor: AppColors.primaryColor,
                        isDisabled: false,
                      ),
                    ],
                  ),
                  20.verticalSpace,
                ],
              ).px(20.w),
            ],
          ),
        );
      ***REMOVED***),
    );
  ***REMOVED***

  static Future<void> show(BuildContext context) =>
      showAppBottomSheet(context, DeleteAccountBottomsheet());
***REMOVED***
