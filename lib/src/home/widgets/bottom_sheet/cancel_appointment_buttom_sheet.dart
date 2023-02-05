import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/enum/order_type.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/providers/get_user_bookings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gharelu/src/core/constant/app_constant.dart';
// import 'package:gharelu/src/core/entity/cancellation_reason_entity.dart';
// import 'package:gharelu/src/core/extensions/extensions.dart';
// import 'package:gharelu/src/core/theme/app_colors.dart';
// import 'package:gharelu/src/core/theme/app_styles.dart';
// import 'package:gharelu/src/core/widgets/widgets.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class CancelAppointmentButtomSheet extends HookConsumerWidget ***REMOVED***
//   const CancelAppointmentButtomSheet(***REMOVED***Key? key***REMOVED***) : super(key: key);

// ***REMOVED***
//   Widget build(BuildContext context, WidgetRef ref) ***REMOVED***
//     final _description = useTextEditingController();
//     ValueNotifier<CancellationReasonEntity?> selectedCancellation =
//         ValueNotifier<CancellationReasonEntity?>(null);
//     return Padding(
//       padding:
//           EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const BottomSheetHeader(title: 'Cancel Appointment'),
//           Column(
//             children: List.generate(
//               AppConstant.cancellationReason.length,
//               (index) ***REMOVED***
//                 final cancellationReason =
//                     AppConstant.cancellationReason[index];
//                 return ValueListenableBuilder(
//                   valueListenable: selectedCancellation,
//                   builder: (context, value, _) ***REMOVED***
//                     return Column(
//                       children: [
//                         RadioListTile<CancellationReasonEntity>(
//                           contentPadding: EdgeInsets.zero,
//                           activeColor: AppColors.primaryColor,
//                           value: cancellationReason,
//                           title: Text(cancellationReason.title),
//                           groupValue: selectedCancellation.value,
//                           onChanged: (value) =>
//                               selectedCancellation.value = value,
//                           subtitle: Text(cancellationReason.description),
//                           enableFeedback: true,
//                         ).py(8.h),
//                 ***REMOVED***
//                     );
//                   ***REMOVED***,
//                 );
//               ***REMOVED***,
//             ),
//           ).px(20.w),
//           25.verticalSpace,
//           ValueListenableBuilder<CancellationReasonEntity?>(
//             valueListenable: selectedCancellation,
//             builder: (context, _, __) ***REMOVED***
//               return AnimatedOpacity(
//                 duration: const Duration(seconds: 1),
//                 opacity: selectedCancellation.value != null ? 1 : 0,
//                 child: selectedCancellation.value != null
//                     ? Row(
//                         children: [
//                           renderCancellationReasonButton(
//                               selectedCancellation.value),
//                           const Spacer(),
//                           CustomButton(
//                             isDisabled: false,
//                             onPressed: () ***REMOVED******REMOVED***,
//                             title: 'Cancel Appointment',
//                             width: 150,
//                             backgroundColor: AppColors.transparent,
//                             titleStyle: AppStyles.text14PxMedium.error,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               side: const BorderSide(
//                                 color: AppColors.errorColor,
//                               ),
//                             ),
//                           ),
//                   ***REMOVED***
//                       )
//                     : Container(),
//               );
//             ***REMOVED***,
//           ).px(20.w),
//           30.verticalSpace,
//   ***REMOVED***
//       ),
//     );
//   ***REMOVED***

// static Future<void> show(BuildContext context) async =>
//     showAppBottomSheet(context, const CancelAppointmentButtomSheet());

//   Widget renderCancellationReasonButton(
//       CancellationReasonEntity? cancellationReason) ***REMOVED***
//     switch (cancellationReason?.id) ***REMOVED***
//       case 1:
//         return CustomButton(
//           isDisabled: false,
//           onPressed: () ***REMOVED******REMOVED***,
//           title: 'Reschedule',
//         );
//       case 2:
//         return CustomButton(
//           isDisabled: false,
//           onPressed: () ***REMOVED******REMOVED***,
//           title: 'Reschedule',
//         );
//       case 3:
//         return CustomButton(
//           isDisabled: false,
//           onPressed: () ***REMOVED******REMOVED***,
//           title: 'Complain',
//         );
//       case 4:
//         return CustomButton(
//           isDisabled: false,
//           onPressed: () ***REMOVED******REMOVED***,
//           title: 'Complain',
//         );
//       default:
//         return const SizedBox.shrink();
//     ***REMOVED***
//   ***REMOVED***
// ***REMOVED***

class CancelAppointmentButtomSheet extends StatelessWidget ***REMOVED***
  const CancelAppointmentButtomSheet(***REMOVED***Key? key, required this.bookingId***REMOVED***) : super(key: key);
  final String bookingId;

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BottomSheetHeader(title: 'Cancel Appointments'),
        Column(
          children: [
            Text('Are you Sure want to Cancel this order?', style: AppStyles.text14PxSemiBold.softBlack),
            20.verticalSpace,
            Row(
              children: [
                Consumer(builder: (context, ref, _) ***REMOVED***
                  ref.listen(getUserBookingsNotifierProvider, (previous, next) ***REMOVED***
                    (next as GetUserBookingsState).maybeWhen(
                      orElse: () => null,
                      success: (previous, upcoming) ***REMOVED***
                        Navigator.pop(context);
                      ***REMOVED***,
                    );
                ***REMOVED***
                  return CustomButton(
                    title: 'Cancel Appoinment',
                    loading: ref.watch(getUserBookingsNotifierProvider).maybeWhen(
                          orElse: () => false,
                          loading: () => true,
                        ),
                    onPressed: () ***REMOVED***
                      ref.read(getUserBookingsNotifierProvider.notifier).updateBookings(bookingId: bookingId, orderType: OrderType.Cancelled);
                    ***REMOVED***,
                    isDisabled: false,
                    backgroundColor: AppColors.errorColor,
                  );
                ***REMOVED***),
                const Spacer(),
                CustomButton(
                  title: 'Cancel',
                  onPressed: () => Navigator.pop(context),
                  isDisabled: false,
                ),
        ***REMOVED***
            ),
    ***REMOVED***
        ).px(20.w),
        20.verticalSpace,
***REMOVED***
    );
  ***REMOVED***

  static Future<void> show(BuildContext context, ***REMOVED***required String bookingId***REMOVED***) async => showAppBottomSheet(context, CancelAppointmentButtomSheet(bookingId: bookingId));
***REMOVED***
