import 'package:auto_route/auto_route.dart';
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

@RoutePage()
class UserSignupView extends HookConsumerWidget {
  const UserSignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _name = useTextEditingController();
    final _email = useTextEditingController();
    final _password = useTextEditingController();
    final _confirmPassword = useTextEditingController();

    ref.listen(userSignupProvider, (previous, next) {
      final state = next as AppState;
      state.maybeWhen(
        orElse: () => null,
        success: (data) => context.router.replaceAll([const DashboardRouter()]),
        error: (message) => context.showSnackbar(message: message),
      );
    });

    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: SingleChildScrollView(
        child: Consumer(builder: (context, ref, _) {
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
                onChanged: (name) {
                  ref.read(userSignupFormProvider.notifier).setName(name);
                },
                title: 'Name',
                controller: _name,
                textInputType: TextInputType.name,
                error: ref.watch(userSignupFormProvider).form.name.errorMessage,
              ),
              20.verticalSpace,
              CustomTextField(
                title: 'Email',
                controller: _email,
                textInputType: TextInputType.emailAddress,
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
                textInputType: TextInputType.visiblePassword,
              ),
              20.verticalSpace,
              CustomTextField(
                onChanged: (confirmPassword) => ref
                    .read(userSignupFormProvider.notifier)
                    .setConfirmPassword(confirmPassword),
                isPassword: true,
                title: 'Confirm Password',
                textInputType: TextInputType.visiblePassword,
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
                      onSuccess: (location, placeId, latlng) {
                        context.router.maybePop();
                        ref
                            .read(userSignupFormProvider.notifier)
                            .setLocation(location, placeId, latlng);
                      },
                    )),
                  ),
                  4.horizontalSpace,
                  Text(
                    ref.watch(userSignupFormProvider).form.location.value,
                    style: AppStyles.text14PxRegular,
                  ).expanded()
                ],
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
                      onPressed: () => context.router.maybePop(),
                      child: const Text('Login')),
                ],
              ),
            ],
          ).px(20);
        }),
      ),
    );
  }
}
