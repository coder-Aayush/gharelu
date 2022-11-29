import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/providers/slot_provider.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectSlotView extends StatefulHookConsumerWidget ***REMOVED***
  const SelectSlotView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  _SelectSlotViewState createState() => _SelectSlotViewState();
***REMOVED***

class _SelectSlotViewState extends ConsumerState<SelectSlotView> ***REMOVED***
***REMOVED***
  void didChangeDependencies() ***REMOVED***
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) ***REMOVED***
      ref.read(slotNotifierProvider.notifier).getBookings(date: DateTime.now());
  ***REMOVED***
    super.didChangeDependencies();
  ***REMOVED***

  ValueNotifier<String?> selectedTime = ValueNotifier<String?>(null);

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return ScaffoldWrapper(
      bottomNavigationBar: BottomAppBar(
        child: ValueListenableBuilder(
          valueListenable: selectedTime,
          builder: (context, value, _) ***REMOVED***
            return CustomButton(
              title: 'Proceed to checkout',
              isDisabled: value == null,
              onPressed: () => context.router.push(const CheckoutRoute()),
            ).px(20);
          ***REMOVED***,
        ),
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
                    onDateSelected: (date) ***REMOVED***
                      selectedTime.value = null;
                      ref
                          .read(slotNotifierProvider.notifier)
                          .getBookings(date: date);
                    ***REMOVED***,
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
                    builder: (context, ref, _) ***REMOVED***
                      return ref.watch(slotNotifierProvider).maybeWhen(
                            orElse: () => Container(),
                            loading: () => const Center(
                                child: CircularProgressIndicator()),
                            success: (data) => Wrap(
                              spacing: 20,
                              runSpacing: 10,
                              children: List.generate(
                                data.length,
                                (index) => ValueListenableBuilder(
                                  valueListenable: selectedTime,
                                  builder: (context, value, _) ***REMOVED***
                                    final isSelected =
                                        selectedTime.value == data[index];
                                    return ActionChip(
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
                                      onPressed: () ***REMOVED***
                                        selectedTime.value = data[index];
                                      ***REMOVED***,
                                    );
                                  ***REMOVED***,
                                ),
                              ),
                            ).px(20),
                          );
                    ***REMOVED***,
                  ),
          ***REMOVED***
              ),
              CustomPaint(
                painter: BodyPainter(),
                child: Container(height: 0),
              )
      ***REMOVED***
          ).toSliverBox,
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***
