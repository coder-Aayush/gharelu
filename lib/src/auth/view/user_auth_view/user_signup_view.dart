import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/auth/providers/forms/signup/user_signup_form_provider.dart';
import 'package:gharelu/src/auth/providers/user_signup_provider.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserSignupView extends HookConsumerWidget ***REMOVED***
  const UserSignupView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context, WidgetRef ref) ***REMOVED***
    final _name = useTextEditingController();
    final _email = useTextEditingController();
    final _password = useTextEditingController();
    final _confirmPassword = useTextEditingController();

    ref.listen(userSignupProvider, (previous, next) ***REMOVED***
      final state = next as AppState;
      state.maybeWhen(
        orElse: () => null,
        success: (data) => context.router.replaceAll([const DashboardRouter()]),
        error: (message) => context.showSnackbar(message: message),
      );
  ***REMOVED***

    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: SingleChildScrollView(
        child: Consumer(builder: (context, ref, _) ***REMOVED***
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Text(
                'Welcome! \nCreate an Account',
                style: AppStyles.text24PxBold,
              ),
              20.verticalSpace,
              CustomTextField(
                onChanged: (name) ***REMOVED***
                  ref.read(userSignupFormProvider.notifier).setName(name);
                ***REMOVED***,
                title: 'Name',
                controller: _name,
                error: ref.watch(userSignupFormProvider).form.name.errorMessage,
              ),
              20.verticalSpace,
              CustomTextField(
                title: 'Email',
                controller: _email,
                onChanged: (email) =>
                    ref.read(userSignupFormProvider.notifier).setEmail(email),
                error:
                    ref.watch(userSignupFormProvider).form.email.errorMessage,
              ),
              20.verticalSpace,
              CustomTextField(
                title: 'Password',
                onChanged: (password) => ref
                    .read(userSignupFormProvider.notifier)
                    .setPassword(password),
                controller: _password,
                isPassword: true,
                error: ref
                    .watch(userSignupFormProvider)
                    .form
                    .password
                    .errorMessage,
              ),
              20.verticalSpace,
              CustomTextField(
                onChanged: (confirmPassword) => ref
                    .read(userSignupFormProvider.notifier)
                    .setConfirmPassword(confirmPassword),
                isPassword: true,
                title: 'Confirm Password',
                controller: _confirmPassword,
                error: ref
                    .watch(userSignupFormProvider)
                    .form
                    .confirmPassword
                    .errorMessage,
              ),
              20.verticalSpace,
              Text(
                'Pick your Location',
                style: AppStyles.text14PxRegular.midGrey,
              ),
              Row(
                children: [
                  ActionChip(
                    label: const Text('Set on Map'),
                    onPressed: () => context.router.push(MapPickerRoute(
                      onSuccess: (location) ***REMOVED***
                        context.router.pop();
                        ref
                            .read(userSignupFormProvider.notifier)
                            .setLocation(location);
                      ***REMOVED***,
                    )),
                  ),
                  4.horizontalSpace,
                  Text(
                    ref.watch(userSignupFormProvider).form.location.value,
                    style: AppStyles.text14PxRegular,
                  ).expanded()
          ***REMOVED***
              ),
              40.verticalSpace,
              Align(
                child: CustomButton(
                  isDisabled: !ref.watch(userSignupFormProvider).form.isValid,
                  title: 'Signup',
                  loading: ref.watch(userSignupProvider).maybeWhen(
                        orElse: () => false,
                        loading: () => true,
                      ),
                  onPressed: () => ref.read(userSignupProvider.notifier).signup(
                        name: _name.text,
                        email: _email.text,
                        password: _password.text,
                        location: ref
                            .watch(userSignupFormProvider)
                            .form
                            .location
                            .value,
                      ),
                ),
              ),
              40.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have account? ',
                    style: AppStyles.text14PxRegular.midGrey,
                  ),
                  TextButton(
                      onPressed: () =>
                          context.router.push(const LoginUserRoute()),
                      child: const Text('Login')),
          ***REMOVED***
              ),
      ***REMOVED***
          ).px(20);
        ***REMOVED***),
      ),
    );
  ***REMOVED***
***REMOVED***
