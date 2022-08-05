import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/auth/providers/login_provider.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginUserView extends HookConsumerWidget {
  const LoginUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _email = useTextEditingController();
    final _password = useTextEditingController();
    ref.listen(loginProvider, (previous, next) {
      final state = next as AppState;
      state.maybeWhen(
        orElse: () => null,
        error: (message) => context.showSnackbar(message: message),
        success: (data) => context.router.push(
          WelcomeRoute(
            buttonTitle: 'Back To Home',
            onPressed: () {},
          ),
        ),
      );
    });
    log('here');
    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Text(
              'Here To Get \nWelcome!',
              style: AppStyles.text24PxBold,
            ),
            80.verticalSpace,
            CustomTextField(
              title: 'Email',
              controller: _email,
            ),
            30.verticalSpace,
            CustomTextField(
              title: 'Password',
              isPassword: true,
              controller: _password,
            ),
            30.verticalSpace,
            Align(
              child: CustomButton(
                isDisabled: false,
                onPressed: () => ref.read(loginProvider.notifier).loginAsUser(
                      email: _email.text,
                      password: _password.text,
                    ),
                title: 'Sign in',
                loading: ref.watch(loginProvider).maybeWhen(
                      orElse: () => false,
                      loading: () => true,
                    ),
              ),
            ),
            40.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have account? ',
                  style: AppStyles.text14PxRegular.midGrey,
                ),
                TextButton(
                  onPressed: () => context.router.pop(),
                  child: const Text('Signup'),
                ),
              ],
            ),
          ],
        ).px(20),
      ),
    );
  }
}
