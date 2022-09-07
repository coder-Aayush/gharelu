import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';

class SelectSlotView extends StatelessWidget ***REMOVED***
  const SelectSlotView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return ScaffoldWrapper(
      bottomNavigationBar: BottomAppBar(
        child: CustomButton(
          title: 'Proceed to checkout',
          isDisabled: false,
          onPressed: () => context.router.push(const CheckoutRoute()),
        ).px(20),
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
                    lastDate: DateTime(DateTime.now().year + 5),
                    onDateSelected: (date) => print(date),
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
                  Wrap(
                    spacing: 20,
                    runSpacing: 10,
                    children: List.generate(
                      20,
                      (index) => ActionChip(
                        label: const Text('10: 00 AM'),
                        onPressed: () ***REMOVED******REMOVED***,
                      ),
                    ),
                  ).px(20),
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
