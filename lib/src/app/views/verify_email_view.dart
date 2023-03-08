import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key, required this.email***REMOVED***) : super(key: key);

  final String email;

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
***REMOVED***

class _VerifyEmailViewState extends State<VerifyEmailView> {
  bool isVerified = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return isVerified;
      ***REMOVED***,
      child: ScaffoldWrapper(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Verify Your Email', style: AppStyles.text26PxBold),
              10.verticalSpace,
              Text.rich(
                TextSpan(
                  style: AppStyles.text14PxLight,
                  children: [
                    const TextSpan(text: 'We\'ve sent email to '),
                    TextSpan(
                      text: widget.email,
                      style: AppStyles.text14PxMedium.primary,
                    ),
                    const TextSpan(
                        text: ' Please verify your email and continue.'),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              20.verticalSpace,
              Consumer(
                builder: (context, ref, child) {
                  return CustomButton(
                    title: 'Continue',
                    isDisabled: false,
                    onPressed: () async {
                      final _ref = ref.read(firebaseAuthProvider);
                      await _ref.currentUser?.reload();
                      final currentUser = _ref.currentUser;
                      isVerified = currentUser?.emailVerified ?? false;
                      if (currentUser?.emailVerified == false) {
                        context.showSnackbar(message: 'Email Not Verified yet');
                      ***REMOVED*** else {
                        context.router.pop();
                      ***REMOVED***
                    ***REMOVED***,
                  );
                ***REMOVED***,
              ),
            ],
          ),
        ),
      ),
    );
  ***REMOVED***
***REMOVED***
