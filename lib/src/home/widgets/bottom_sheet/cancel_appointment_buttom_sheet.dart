import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/constant/app_constant.dart';
import 'package:gharelu/src/core/entity/cancellation_reason_entity.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CancelAppointmentButtomSheet extends HookConsumerWidget ***REMOVED***
  const CancelAppointmentButtomSheet(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context, WidgetRef ref) ***REMOVED***
    final _description = useTextEditingController();
    ValueNotifier<CancellationReasonEntity?> selectedCancellation =
        ValueNotifier<CancellationReasonEntity?>(null);
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BottomSheetHeader(title: 'Cancel Appointment'),
          10.verticalSpace,
          Column(
            children: List.generate(
              AppConstant.cancellationReason.length,
              (index) ***REMOVED***
                final cancellationReason =
                    AppConstant.cancellationReason[index];
                return ValueListenableBuilder(
                  valueListenable: selectedCancellation,
                  builder: (context, value, _) ***REMOVED***
                    return RadioListTile<CancellationReasonEntity>(
                      value: cancellationReason,
                      title: Text(cancellationReason.title),
                      groupValue: cancellationReason,
                      onChanged: (value) ***REMOVED******REMOVED***,
                    );
                  ***REMOVED***,
                );
              ***REMOVED***,
            ),
          ).px(20.w),
  ***REMOVED***
      ),
    );
  ***REMOVED***

  static Future<void> show(BuildContext context) async =>
      showAppBottomSheet(context, const CancelAppointmentButtomSheet());
***REMOVED***
