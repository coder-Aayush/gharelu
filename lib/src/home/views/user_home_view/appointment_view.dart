import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/providers/get_user_bookings.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppointmentView extends ConsumerWidget {
  const AppointmentView({Key? key***REMOVED***) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('rebuild');
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: ScaffoldWrapper(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            'Appointments',
            style: AppStyles.text18PxMedium.white,
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Previous'),
              Tab(text: 'Upcoming'),
            ],
          ),
        ),
        body: Consumer(
          builder: (context, ref, _) {
            return ref.watch(getUserBookingsNotifierProvider).maybeWhen(
                  orElse: Container.new,
                  loading: () => context.loader,
                  error: (message) => Text(message),
                  success: (previous, upcoming) => TabBarView(
                    children: [
                      RefreshIndicator(
                        onRefresh: () async {
                          await ref.refresh(getUserBookingsNotifierProvider);
                        ***REMOVED***,
                        child: previous.isEmpty
                            ? Center(
                                child: NoDataFound(
                                  title: 'No Previous Appointments Found',
                                  onRefresh: () => ref
                                      .refresh(getUserBookingsNotifierProvider),
                                ),
                              )
                            : ListView.builder(
                                itemBuilder: (context, index) =>
                                    BookingProductTile(
                                  booking: previous[index],
                                  onButton: (product) {***REMOVED***,
                                ).py(10.h).px(10.w),
                                itemCount: previous.length,
                              ),
                      ),
                      RefreshIndicator(
                        onRefresh: () async {
                          await ref.refresh(getUserBookingsNotifierProvider);
                        ***REMOVED***,
                        child: upcoming.isEmpty
                            ? Center(
                                child: NoDataFound(
                                  title: 'No Upcoming Appointments Found',
                                  onRefresh: () => ref
                                      .refresh(getUserBookingsNotifierProvider),
                                ),
                              )
                            : ListView.builder(
                                itemBuilder: (context, index) {
                                  final product = upcoming[index];
                                  return BookingProductTile(
                                    booking: product,
                                    onButton: (product) {***REMOVED***,
                                  ).py(10.h).px(10.w);
                                ***REMOVED***,
                                itemCount: upcoming.length,
                              ),
                      ),
                    ],
                  ),
                );
          ***REMOVED***,
        ),
      ),
    );
  ***REMOVED***
***REMOVED***
