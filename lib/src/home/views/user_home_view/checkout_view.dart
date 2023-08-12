import 'package:auto_route/auto_route.dart';
import 'dart:convert';
import 'dart:developer';

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

@RoutePage<void>()
class CheckoutView extends HookConsumerWidget {
  const CheckoutView(
      {Key? key, required this.date, required this.time, required this.service})
      : super(key: key);
  final String date;
  final String time;
  final ServiceModel service;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(createBookingProvider, (previous, next) {
      final state = next as AppState;
      state.maybeWhen(
        orElse: () => null,
        success: (data) async {
          context.showSnackbar(message: 'Booking Confirm');
          ref.read(getUserBookingsNotifierProvider.notifier).getBookings();
          context.router.root.innerRouterOf(DashboardRouter.name)
            ?..innerRouterOf<TabsRouter>(DashboardRouter.name)
                ?.setActiveIndex(1)
            ..navigate(const AppointmentRouter());
          context.router
              .popUntil((route) => route.settings.name == DashboardRouter.name);
        },
      );
    });
    return Consumer(
      builder: (context, ref, _) {
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
                builder: (context, ref, _) {
                  final _cart = ref.watch(cartStateProvider);
                  return Column(
                    children: [
                      10.verticalSpace,
                      PaymentCard(
                        title: 'Pay with Khalti',
                        onPressed: () async {
                          final config = PaymentConfig(
                            amount: ((_cart.totalPrice + 50) *
                                100), // Amount should be in paisa
                            productIdentity: _cart.products.first.serviceId,
                            productName: '${_cart.products.first.categoryId}',
                          );
                          await KhaltiScope.of(context).pay(
                            config: config,
                            preferences: [
                              PaymentPreference.khalti,
                              PaymentPreference.mobileBanking,
                            ],
                            onSuccess: (value) async {
                              for (var i = 0; i < _cart.products.length; i++) {
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
                              }
                            },
                            onFailure: (value) {
                              context.showSnackbar(message: value.message);
                            },
                          );
                        },
                        icon: Assets.icons.khaltiLogo.svg(height: 23.h),
                      ),
                      20.verticalSpace,
                      PaymentCard(
                        title: 'Pay with eSewa',
                        icon: Assets.images.esewaLogo.image(height: 23.h),
                        onPressed: () {
                          context.showSnackbar(
                              message: 'Unable to Pay with eSEWA');
                        },
                        titleColor: const Color(0xff60BB47),
                      ),
                    ],
                  ).px(20).toSliverBox;
                },
              )
            ],
          ),
        );
      },
    );
  }
}
