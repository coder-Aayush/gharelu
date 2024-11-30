import 'package:auto_route/auto_route.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/date_time_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/models/service_model.dart';
import 'package:gharelu/src/home/providers/slot_provider.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SelectSlotView extends StatefulHookConsumerWidget {
  const SelectSlotView({Key? key, required this.service}) : super(key: key);
  final ServiceModel service;
  @override
  _SelectSlotViewState createState() => _SelectSlotViewState();
}

class _SelectSlotViewState extends ConsumerState<SelectSlotView> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(slotNotifierProvider.notifier)
          .getBookings(date: DateTime.now(), serviceId: widget.service.id);
    });
    super.didChangeDependencies();
  }

  ValueNotifier<String?> selectedTime = ValueNotifier<String?>(null);
  ValueNotifier<DateTime> selectedDate =
      ValueNotifier<DateTime>(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: selectedTime,
        builder: (context, value, _) {
          return CustomButton(
            title: 'Proceed to checkout',
            isDisabled: value == null,
            onPressed: () => context.router.push(CheckoutRoute(
              date: selectedDate.value.serverFormattedDate(),
              time: selectedTime.value!,
              service: widget.service,
            )),
          ).px(20).py(10.h);
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const AutoLeadingButton(color: AppColors.whiteColor),
            backgroundColor: AppColors.primaryColor,
            title: Text(
              'Select Slot',
              style: AppStyles.text20PxBold.white,
            ),
            floating: true,
          ),
          Stack(
            children: [
              Column(
                children: [
                  10.verticalSpace,
                  CalendarTimeline(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 1),
                    onDateSelected: (date) {
                      selectedTime.value = null;
                      ref.read(slotNotifierProvider.notifier).getBookings(
                          date: date, serviceId: widget.service.id);
                      selectedDate.value = date;
                    },
                    leftMargin: 20,
                    monthColor: Colors.blueGrey,
                    dayColor: Colors.teal[200],
                    activeDayColor: Colors.white,
                    activeBackgroundDayColor:
                        AppColors.primaryColor.withOpacity(.8),
                    dotsColor: AppColors.midGreyColor,
                  ),
                  20.verticalSpace,
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.midWhite,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'Free cancellation till 6 hrs before the booked slot, post that Rs 100 chargeable',
                      style: AppStyles.text12PxMedium.softBlack,
                    ),
                  ).px(20),
                  20.verticalSpace,
                  Consumer(
                    builder: (context, ref, _) {
                      return ref.watch(slotNotifierProvider).maybeWhen(
                            orElse: () => Container(),
                            loading: () => context.loader,
                            success: (data) => Wrap(
                              spacing: 20,
                              runSpacing: 10,
                              children: List.generate(
                                data.length,
                                (index) => ValueListenableBuilder(
                                  valueListenable: selectedTime,
                                  builder: (context, value, _) {
                                    final isSelected =
                                        selectedTime.value == data[index];
                                    return ActionChip(
                                      side: BorderSide(
                                        width: 0,
                                        color: isSelected
                                            ? AppColors.transparent
                                            : AppColors.softBlack
                                                .withOpacity(.4),
                                      ),
                                      backgroundColor: isSelected
                                          ? AppColors.primaryColor
                                          : AppColors.transparent,
                                      label: Text(
                                        data[index],
                                        style: isSelected
                                            ? AppStyles.text14PxMedium.white
                                            : AppStyles
                                                .text14PxMedium.softBlack,
                                      ),
                                      onPressed: () {
                                        selectedTime.value = data[index];
                                      },
                                    );
                                  },
                                ),
                              ),
                            ).px(20),
                          );
                    },
                  ),
                ],
              ),
              CustomPaint(
                painter: BodyPainter(),
                child: Container(height: 0),
              )
            ],
          ).toSliverBox,
        ],
      ),
    );
  }
}
