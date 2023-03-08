import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/auth/providers/forms/login/user_login_form_provider.dart';
import 'package:gharelu/src/auth/providers/merchant_login_provider.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MerchantLoginView extends HookConsumerWidget {
  const MerchantLoginView({Key? key***REMOVED***) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _email = useTextEditingController();
    final _password = useTextEditingController();

    // list for the login event
    ref.listen(merchantLoginProvider, (previous, next) {
      final state = next as AppState;
      state.maybeWhen(
        orElse: () => null,
        error: (message) => context.showSnackbar(message: message),
        success: (data) {
          context.router.replaceAll([const MerchantDashboardRouter()]);
          context.showSnackbar(message: 'Your are logged in');
        ***REMOVED***,
      );
    ***REMOVED***
    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text('Login as Merchant'),
      ),
      body: SingleChildScrollView(
        child: Consumer(builder: (context, ref, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.verticalSpace,
              Text(
                'Here To Get \nWelcome!',
                style: AppStyles.text24PxBold,
              ),
              30.verticalSpace,
              CustomTextField(
                title: 'Email',
                controller: _email,
                textInputType: TextInputType.emailAddress,
                error: ref.watch(userLoginFormProvider).form.email.errorMessage,
                onChanged: (email) =>
                    ref.read(userLoginFormProvider.notifier).setEmail(email),
              ),
              22.verticalSpace,
              CustomTextField(
                title: 'Password',
                isPassword: true,
                controller: _password,
                textInputType: TextInputType.visiblePassword,
                onChanged: (password) => ref
                    .read(userLoginFormProvider.notifier)
                    .setPassword(password),
                error:
                    ref.watch(userLoginFormProvider).form.password.errorMessage,
              ),
              40.verticalSpace,
              Align(
                child: CustomButton(
                  loading: ref.watch(merchantLoginProvider).maybeWhen(
                        orElse: () => false,
                        loading: () => true,
                      ),
                  onPressed: () => ref
                      .read(merchantLoginProvider.notifier)
                      .loginAsMerchant(
                          email: _email.text, password: _password.text),
                  title: 'Sign in',
                  isDisabled: !ref.watch(userLoginFormProvider).form.isValid,
                ),
              ),
              40.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have account?',
                    style: AppStyles.text14PxRegular.midGrey,
                  ),
                  TextButton(
                    onPressed: () => context.router.push(MerchantSignupRoute()),
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          );
        ***REMOVED***),
      ).px(20),
    );
  ***REMOVED***
***REMOVED***
