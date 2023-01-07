import 'dart:convert';
***REMOVED***

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/data_source/booking_data_source.dart';
import 'package:gharelu/src/home/models/service_model.dart';
import 'package:gharelu/src/home/providers/cart_provider.dart';
import 'package:gharelu/src/home/providers/get_user_bookings.dart';
import 'package:gharelu/src/home/providers/make_booking_provider.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class CheckoutView extends HookConsumerWidget ***REMOVED***
  const CheckoutView(
      ***REMOVED***Key? key, required this.date, required this.time, required this.service***REMOVED***)
      : super(key: key);
  final String date;
  final String time;
  final ServiceModel service;

***REMOVED***
  Widget build(BuildContext context, WidgetRef ref) ***REMOVED***
    ref.listen(createBookingProvider, (previous, next) ***REMOVED***
      final state = next as AppState;
      state.maybeWhen(
        orElse: () => null,
        success: (data) async ***REMOVED***
          context.showSnackbar(message: 'Booking Confirm');
          ref.read(getUserBookingsNotifierProvider.notifier).getBookings();
          context.router.root.innerRouterOf(DashboardRouter.name)
            ?..innerRouterOf<TabsRouter>(DashboardRouter.name)
                ?.setActiveIndex(1)
            ..navigate(const AppointmentRouter());
          context.router
              .popUntil((route) => route.settings.name == DashboardRouter.name);
        ***REMOVED***,
      );
  ***REMOVED***
    return Consumer(
      builder: (context, ref, _) ***REMOVED***
        return ScaffoldWrapper(
          loading: ref.watch(createBookingProvider).maybeWhen(
                orElse: () => false,
                loading: () => true,
              ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: const AutoLeadingButton(color: AppColors.whiteColor),
                backgroundColor: AppColors.primaryColor,
                title: Text(
                  'Confirm Booking',
                  style: AppStyles.text20PxBold.white,
                ),
                floating: true,
              ),
              Consumer(
                builder: (context, ref, _) ***REMOVED***
                  final _cart = ref.watch(cartStateProvider);
                  return Column(
                    children: [
                      10.verticalSpace,
                      PaymentCard(
                        title: 'Pay with Khalti',
                        onPressed: () async ***REMOVED***
                          final config = PaymentConfig(
                            amount: ((_cart.totalPrice + 50) *
                                100), // Amount should be in paisa
                            productIdentity: _cart.products.first.serviceId,
                            productName: '$***REMOVED***_cart.products.first.categoryId***REMOVED***',
                          );
                          await KhaltiScope.of(context).pay(
                            config: config,
                            preferences: [
                              PaymentPreference.khalti,
                              PaymentPreference.mobileBanking,
                      ***REMOVED***
                            onSuccess: (value) async ***REMOVED***
                              for (var i = 0; i < _cart.products.length; i++) ***REMOVED***
                                ref
                                    .read(createBookingProvider.notifier)
                                    .createBookings(
                                      booking: _cart.booking(
                                        bookingDate: date,
                                        time: time,
                                        serviceId: service.id,
                                        userId: '',
                                        merchantId: service.merchantId,
                                      ),
                                    );
                              ***REMOVED***
                            ***REMOVED***,
                            onFailure: (value) ***REMOVED***
                              context.showSnackbar(message: value.message);
                            ***REMOVED***,
                          );
                        ***REMOVED***,
                        icon: Assets.icons.khaltiLogo.svg(height: 23.h),
                      ),
                      20.verticalSpace,
                      PaymentCard(
                        title: 'Pay with eSewa',
                        icon: Assets.images.esewaLogo.image(height: 23.h),
                        onPressed: () ***REMOVED***
                          context.showSnackbar(
                              message: 'Unable to Pay with eSEWA');
                        ***REMOVED***,
                        titleColor: const Color(0xff60BB47),
                      ),
              ***REMOVED***
                  ).px(20).toSliverBox;
                ***REMOVED***,
              )
      ***REMOVED***
          ),
        );
      ***REMOVED***,
    );
  ***REMOVED***
***REMOVED***
