import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/enum/order_type.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/models/booking_model.dart';
import 'package:gharelu/src/home/models/product_model.dart';
import 'package:gharelu/src/home/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';

class ProductTile extends StatelessWidget {
  ProductTile({Key? key, required this.image, required this.name, this.description, required this.price, this.max = 10, this.itemInCart = false, required this.onButtomPressed, this.orderDetails, this.status, this.booking, this.buttonTitle, required this.id}) : super(key: key) {
    if (status != null && booking == null) {
      throw Exception('if status is provided, we need product too');
    }
  }
  final String id;
  final String image;
  final String name;
  final String? description;
  final int price;
  final int max;
  final bool itemInCart;
  final VoidCallback onButtomPressed;
  final OrderType? status;
  final Widget? orderDetails;
  final BookingModel? booking;
  final String? buttonTitle;

  double get buttonHeight => 32;
  double get buttonWidth => 110;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: status == OrderType.Cancelled ? AppColors.errorColor : AppColors.softBlack.withOpacity(.4),
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r),
            ),
            child: CacheImageViewer(
              imageUrl: image,
              width: 140,
              height: 150,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppStyles.text16PxMedium,
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
              2.verticalSpace,
              if (orderDetails == null)
                Text(
                  description!,
                  style: AppStyles.text12PxBold.midGrey,
                  textAlign: TextAlign.left,
                )
              else
                orderDetails!,
              if (status == null)
                Row(
                  children: [
                    Text('Rs: $price', style: AppStyles.text14PxBold.primary),
                    const Spacer(),
                    if (!itemInCart)
                      CustomButton(
                        title: buttonTitle ?? 'Add to Cart',
                        onPressed: onButtomPressed,
                        height: buttonHeight,
                        width: buttonWidth,
                        titleStyle: AppStyles.text12PxMedium.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        isDisabled: false,
                      )
                  ],
                ).pOnly(top: 16)
              else
                statusButton(context).pOnly(top: 14.h),
            ],
          ).px(12).expanded(),
        ],
      ),
    );
  }

  Widget statusButton(BuildContext context) {
    final now = DateTime.now();
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(4));
    final updatedHour = DateTime.fromMillisecondsSinceEpoch(booking!.updatedAt);
    print(now.subtract(Duration(hours: 6)).millisecondsSinceEpoch);
    if (status == OrderType.Pending) {
      return CustomButton(
        title: 'Cancel Appoinment',
        isDisabled: !now.subtract(const Duration(hours: 6)).isBefore(updatedHour),
        onPressed: () {
          CancelAppointmentButtomSheet.show(context, bookingId: id);
        },
        height: buttonHeight,
        width: buttonWidth + 10,
        titleStyle: AppStyles.text12PxMedium.white,
        shape: shape,
      );
    } else if (status == OrderType.Completed) {
      return Text('Order Completed', style: AppStyles.text12PxMedium.primary);
    } else
      return Text('Order Canceled', style: AppStyles.text12PxMedium.error);
  }
}
