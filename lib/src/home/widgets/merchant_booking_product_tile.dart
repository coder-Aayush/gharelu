import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/enum/order_type.dart';
import 'package:gharelu/src/core/extensions/date_time_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/models/booking_model.dart';
import 'package:gharelu/src/home/providers/get_merchant_bookings_provider.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MerchantBookingProductTile extends StatelessWidget {
  const MerchantBookingProductTile({Key? key, required this.booking***REMOVED***)
      : super(key: key);
  final BookingModel booking;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      GradientCircle(
                        child: Center(
                          child: Text(
                            (booking.user?.name ?? ' ').split(' ')[0],
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            booking.user?.name ?? '',
                            style: AppStyles.text16PxSemiBold.softBlack,
                          ),
                          Text(
                            '#${booking.user?.uid ?? ''***REMOVED***',
                            style: AppStyles.text10PxRegular.primary,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // IgnorePointer(
                //   ignoring: booking.user?.phoneNumber != null,
                //   child: booking.user?.phoneNumber != null

                // ),
                Row(
                  children: [
                    // IconButton(
                    //   onPressed: () async => await launchUrlString(
                    //       'tel:${booking.user?.phoneNumber***REMOVED***'),
                    //   icon: Icon(
                    //     Icons.phone,
                    //     color: AppColors.softBlack.withOpacity(.4),
                    //   ),
                    // ),
                    // IconButton(
                    //   onPressed: () {***REMOVED***,
                    //   icon: Assets.icons.chat.svg(),
                    // ),
                  ],
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: CacheImageViewer(
                    imageUrl: booking.product?.image,
                    height: 100.h,
                    width: 100.w,
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.product?.name ?? '',
                        style: AppStyles.text16PxSemiBold.softBlack,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                      ),
                      2.verticalSpace,
                      Text(
                        booking.product?.description ?? '',
                        style: AppStyles.text12PxRegular.midGrey,
                        textAlign: TextAlign.left,
                      ),
                      6.verticalSpace,
                      // booking date and time
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconWithTitle(
                            icon: Assets.icons.clockIcon.path,
                            title: DateTime.parse(booking.date).formattedDate(),
                          ),
                          IconWithTitle(
                            icon: Assets.icons.handWatchIcon.path,
                            title: booking.time,
                          ),
                        ],
                      ),
                      6.verticalSpace,
                      Consumer(
                        builder: (context, ref, _) {
                          return DropdownButtonHideUnderline(
                            child: DropdownButton2<OrderType>(
                              buttonHeight: 32,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.softBlack.withOpacity(.4),
                                  ),
                                ],
                              ),
                              onChanged: (value) => ref
                                  .read(
                                      getMerchantBookingsStateProvider.notifier)
                                  .updateBookings(
                                    bookingId: booking.id,
                                    orderType: value!,
                                  ),
                              enableFeedback: true,
                              value: booking.orderType,
                              items: [
                                DropdownMenuItem(
                                  child: Text(OrderType.Pending.name),
                                  value: OrderType.Pending,
                                ),
                                DropdownMenuItem(
                                  child: Text(OrderType.Completed.name),
                                  value: OrderType.Completed,
                                ),
                                const DropdownMenuItem(
                                  child: Text(
                                    'Cancel',
                                    style:
                                        TextStyle(color: AppColors.errorColor),
                                  ),
                                  value: OrderType.Cancelled,
                                ),
                              ],
                            ),
                          );
                        ***REMOVED***,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                tilePadding: EdgeInsets.zero,
                title: const Text('Payment Info'),
                onExpansionChanged: (value) {***REMOVED***,
                childrenPadding: EdgeInsets.zero,
                children: [
                  ExpensionTileContent(
                    title: 'Item Price: ',
                    description: 'Rs ${booking.totalPrice - 60***REMOVED***',
                  ),
                  3.verticalSpace,
                  const ExpensionTileContent(
                    title: 'Convenience Fee: ',
                    description: 'Rs 60',
                  ),
                  3.verticalSpace,
                  Divider(color: AppColors.softBlack.withOpacity(.2)),
                  ExpensionTileContent(
                    title: 'Total: ',
                    description: 'Rs ${booking.totalPrice***REMOVED***',
                  ),
                  4.verticalSpace,
                ],
              ),
            )
          ],
        ),
      ),
    );
  ***REMOVED***
***REMOVED***



