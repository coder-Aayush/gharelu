import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/auth/providers/forms/login/user_login_form_provider.dart';
import 'package:gharelu/src/auth/providers/user_login_provider.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginUserView extends HookConsumerWidget ***REMOVED***
  const LoginUserView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context, WidgetRef ref) ***REMOVED***
    final _email = useTextEditingController();
    final _password = useTextEditingController();
    ref.listen(userLoginProvider, (previous, next) ***REMOVED***
      final state = next as AppState;
      state.maybeWhen(
        orElse: () => null,
        error: (message) => context.showSnackbar(message: message),
        success: (data) => context.router.push(
          WelcomeRoute(
            buttonTitle: 'Back To Home',
            onPressed: () ***REMOVED***
              context.router.replaceAll([const DashboardRouter()]);
            ***REMOVED***,
          ),
        ),
      );
  ***REMOVED***
    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Consumer(builder: (context, ref, _) ***REMOVED***
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Text(
                'Here To Get \nWelcome!',
                style: AppStyles.text24PxBold,
              ),
              80.verticalSpace,
              Consumer(
                builder: (context, ref, child) ***REMOVED***
                  return CustomTextField(
                    onChanged: (email) => ref
                        .read(userLoginFormProvider.notifier)
                        .setEmail(email),
                    title: 'Email',
                    error: ref
                        .watch(userLoginFormProvider)
                        .form
                        .email
                        .errorMessage,
                    controller: _email,
                  );
                ***REMOVED***,
              ),
              30.verticalSpace,
              CustomTextField(
                title: 'Password',
                onChanged: (password) => ref
                    .read(userLoginFormProvider.notifier)
                    .setPassword(password),
                isPassword: true,
                error:
                    ref.watch(userLoginFormProvider).form.password.errorMessage,
                controller: _password,
              ),
              30.verticalSpace,
              Align(
                child: CustomButton(
                  isDisabled: !ref.watch(userLoginFormProvider).form.isValid,
                  onPressed: () =>
                      ref.read(userLoginProvider.notifier).loginAsUser(
                            email: _email.text,
                            password: _password.text,
                          ),
                  title: 'Sign in',
                  loading: ref.watch(userLoginProvider).maybeWhen(
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
          ***REMOVED***
              ),
      ***REMOVED***
          ).px(20);
        ***REMOVED***),
      ),
    );
  ***REMOVED***
***REMOVED***
