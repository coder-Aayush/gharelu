import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/date_time_extension.dart';
import 'package:intl/intl.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/models/booking_model.dart';
import 'package:gharelu/src/home/models/product_model.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookingProductTile extends StatefulHookConsumerWidget {
  const BookingProductTile({Key? key, required this.booking, required this.onButton***REMOVED***) : super(key: key);
  final BookingModel booking;
  final Function(BookingModel) onButton;

  @override
  _UpcomingProductTileState createState() => _UpcomingProductTileState();
***REMOVED***

class _UpcomingProductTileState extends ConsumerState<BookingProductTile> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final booking = widget.booking;
    super.build(context);
    return ProductTile(
      id: booking.id,
      image: booking.product?.image ?? '',
      name: booking.product?.name ?? '',
      price: widget.booking.totalPrice,
      onButtomPressed: () => widget.onButton.call(widget.booking),
      status: booking.orderType,
      booking: booking,
      orderDetails: Row(
        children: [
          IconWithTitle(
            icon: Assets.icons.clockIcon.path,
            title: DateTime.parse(booking.date).formattedDate(),
          ),
          const Spacer(),
          IconWithTitle(
            icon: Assets.icons.handWatchIcon.path,
            title: booking.time,
          ),
        ],
      ).pOnly(top: 2.h),
    );
  ***REMOVED***

  @override
  bool get wantKeepAlive => true;
***REMOVED***
