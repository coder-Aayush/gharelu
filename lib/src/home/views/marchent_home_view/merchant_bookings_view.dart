import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/providers/get_merchant_bookings_provider.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MerchantBookingsView extends HookWidget ***REMOVED***
  const MerchantBookingsView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    final tabController = useTabController(initialLength: 2, initialIndex: 1);
    return ScaffoldWrapper(
      appBar: AppBar(
        // backgroundColor: AppColors.primaryColor,
        title: const Text('Your Bookings'),
        bottom: TabBar(
          splashFactory: NoSplash.splashFactory,
          automaticIndicatorColorAdjustment: true,
          controller: tabController,
          labelStyle: AppStyles.text14PxSemiBold.white,
          tabs: [
            const Tab(text: 'Previous'),
            const Tab(text: 'Upcoming'),
    ***REMOVED***
        ),
      ),
      body: Consumer(builder: (context, ref, _) ***REMOVED***
        return ref.watch(getMerchantBookingsStateProvider).maybeWhen(
              orElse: Container.new,
              loading: () => context.loader,
              error: (message) ***REMOVED***
                context.showErorDialog(message: message);
                return Container();
              ***REMOVED***,
              success: (previous, upcoming) => TabBarView(
                controller: tabController,
                children: [
                  RefreshIndicator(
                    onRefresh: () async ***REMOVED***
                      await ref.refresh(getMerchantBookingsStateProvider);
                    ***REMOVED***,
                    child: previous.isEmpty
                        ? Center(
                            child: NoDataFound(
                              title: 'No Previous Bookings Found',
                              onRefresh: () => ref.refresh(getMerchantBookingsStateProvider),
                            ),
                          )
                        : ListView.builder(
                            itemBuilder: (context, index) => MerchantBookingProductTile(
                              booking: previous[index],
                            ).py(10.h).px(10.w),
                            itemCount: previous.length,
                          ),
                  ),
                  RefreshIndicator(
                    onRefresh: () async ***REMOVED***
                      await ref.refresh(getMerchantBookingsStateProvider);
                    ***REMOVED***,
                    child: upcoming.isEmpty
                        ? Center(
                            child: NoDataFound(
                              title: 'No Upcoming Bookings Found',
                              onRefresh: () => ref.refresh(getMerchantBookingsStateProvider),
                            ),
                          )
                        : ListView.builder(
                            itemBuilder: (context, index) ***REMOVED***
                              final product = upcoming[index];
                              return MerchantBookingProductTile(
                                booking: product,
                              ).py(10.h).px(10.w);
                            ***REMOVED***,
                            itemCount: upcoming.length,
                          ),
                  ),
          ***REMOVED***
              ),
            );
      ***REMOVED***),
    );
  ***REMOVED***
***REMOVED***
