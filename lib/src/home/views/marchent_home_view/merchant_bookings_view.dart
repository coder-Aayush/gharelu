import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';

class MerchantBookingsView extends HookWidget ***REMOVED***
  const MerchantBookingsView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    final tabController = useTabController(initialLength: 2);
    return ScaffoldWrapper(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Your Bookings', style: AppStyles.text16PxSemiBold.white),
        bottom: TabBar(
          controller: tabController,
          labelStyle: AppStyles.text14PxSemiBold.softBlack,
          tabs: [
            const Tab(text: 'Previous'),
            const Tab(text: 'Upcoming'),
    ***REMOVED***
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(),
          Container(),
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***
