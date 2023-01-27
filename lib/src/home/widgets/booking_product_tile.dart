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

class BookingProductTile extends StatefulHookConsumerWidget ***REMOVED***
  const BookingProductTile(***REMOVED***Key? key, required this.booking, required this.onButton***REMOVED***) : super(key: key);
  final BookingModel booking;
  final Function(BookingModel) onButton;

***REMOVED***
  _UpcomingProductTileState createState() => _UpcomingProductTileState();
***REMOVED***

class _UpcomingProductTileState extends ConsumerState<BookingProductTile> with AutomaticKeepAliveClientMixin ***REMOVED***
***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
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
  ***REMOVED***
      ).pOnly(top: 2.h),
    );
  ***REMOVED***

***REMOVED***
  bool get wantKeepAlive => true;
***REMOVED***
