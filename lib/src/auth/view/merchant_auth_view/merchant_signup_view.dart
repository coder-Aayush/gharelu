***REMOVED***
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/auth/providers/forms/signup/merchant_signup_form_provider.dart';
import 'package:gharelu/src/auth/providers/merchant_signup_provider.dart';
import 'package:gharelu/src/auth/widgets/widgets.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class MerchantSignupView extends HookConsumerWidget ***REMOVED***
  const MerchantSignupView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context, WidgetRef ref) ***REMOVED***
    ref.listen(merchantSignupProvider, (previous, next) ***REMOVED***
      final state = next as AppState;
      state.maybeWhen(
        orElse: () => null,
        error: (message) => context.showSnackbar(message: message),
        success: (data) => context.showSnackbar(message: data.toString()),
      );
  ***REMOVED***
    final _name = useTextEditingController();
    final _email = useTextEditingController();
    final _phoneNumber = useTextEditingController();
    final _password = useTextEditingController();
    final documents = useState(<File>[]);
    final myLocation = useState('');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup as Merchant'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Text(
              'Welcome! \nCreate an Account',
              style: AppStyles.text24PxBold,
            ),
            20.verticalSpace,
            CustomTextField(
              textInputType: TextInputType.name,
              title: 'Name',
              controller: _name,
              onChanged: (name) =>
                  ref.read(merchantSignupFormProvider.notifier).setName(name),
              error:
                  ref.watch(merchantSignupFormProvider).form.name.errorMessage,
            ),
            20.verticalSpace,
            CustomTextField(
              textInputType: TextInputType.emailAddress,
              title: 'Email',
              controller: _email,
              onChanged: (email) =>
                  ref.read(merchantSignupFormProvider.notifier).setEmail(email),
              error:
                  ref.watch(merchantSignupFormProvider).form.email.errorMessage,
            ),
            20.verticalSpace,
            CustomTextField(
              textInputType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              title: 'Phone Number',
              controller: _phoneNumber,
              onChanged: (phoneNumber) => ref
                  .read(merchantSignupFormProvider.notifier)
                  .setPhoneNumber(phoneNumber),
              error: ref
                  .watch(merchantSignupFormProvider)
                  .form
                  .phoneNumber
                  .errorMessage,
            ),
            20.verticalSpace,
            CustomTextField(
              textInputType: TextInputType.visiblePassword,
              title: 'Password',
              controller: _password,
              isPassword: true,
              onChanged: (password) => ref
                  .read(merchantSignupFormProvider.notifier)
                  .setPassword(password),
              error: ref
                  .watch(merchantSignupFormProvider)
                  .form
                  .password
                  .errorMessage,
            ),
            20.verticalSpace,
            Text(
              'Company Registration or Citizenship photo',
              style: AppStyles.text14PxRegular.midGrey,
            ),
            ActionChip(
              label: const Text('Upload'),
              onPressed: () async ***REMOVED***
                final imagePath = (await ImagePicker().pickMultiImage());
                if (imagePath != null) ***REMOVED***
                  ref
                      .read(merchantSignupFormProvider.notifier)
                      .setDocuments(imagePath.map((e) => e.path).toList());
                  log(imagePath.toString());
                ***REMOVED***
              ***REMOVED***,
            ),
            20.verticalSpace,
            Wrap(
              runSpacing: 20.h,
              spacing: 6.w,
              children: ref
                  .watch(merchantSignupFormProvider)
                  .form
                  .documents
                  .map(
                    (doc) => DottedImageViewer(
                      image: doc.value,
                      onDelete: () => ref
                          .read(merchantSignupFormProvider.notifier)
                          .removeDocument(doc),
                    ),
                  )
                  .toList(),
            ),
            if (ref.watch(merchantSignupFormProvider).form.documents.isNotEmpty)
              20.verticalSpace,
            Text(
              'Location',
              style: AppStyles.text14PxRegular.midGrey,
            ),
            Row(
              children: [
                ActionChip(
                  label: const Text('Set on Map'),
                  onPressed: () => context.router.push(
                    MapPickerRoute(
                      onSuccess: (location) ***REMOVED***
                        context.router.pop();
                        // ref.read(merchantSignupProvider).
                        ref
                            .read(merchantSignupFormProvider.notifier)
                            .setLocation(location);
                        myLocation.value = location;
                      ***REMOVED***,
                    ),
                  ),
                ),
                3.horizontalSpace,
                Text(ref.watch(merchantSignupFormProvider).form.location.value)
                    .expanded()
        ***REMOVED***
            ),
            40.verticalSpace,
            Align(
              child: CustomButton(
                loading: ref
                    .watch(merchantSignupProvider)
                    .maybeWhen(orElse: () => false, loading: () => true),
                onPressed: () =>
                    ref.read(merchantSignupProvider.notifier).signupAsMerchant(
                          email: _email.text,
                          name: _name.text,
                          phoneNumber: _phoneNumber.text,
                          password: _password.text,
                          documents: ref
                              .watch(merchantSignupFormProvider)
                              .form
                              .documents
                              .map((file) => File(file.value))
                              .toList(),
                          location: ref
                              .watch(merchantSignupFormProvider)
                              .form
                              .location
                              .value,
                        ),
                title: 'Sign Up',
                isDisabled: !ref.watch(merchantSignupFormProvider).form.isValid,
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
                      context.router.push(const MerchantLoginRoute()),
                  child: const Text('Login'),
                ),
        ***REMOVED***
            ),
    ***REMOVED***
        ),
      ).px(20),
    );
  ***REMOVED***
***REMOVED***
