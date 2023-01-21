import 'package:flutter/material.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';

class MerchantDashboardView extends StatelessWidget ***REMOVED***
  const MerchantDashboardView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return AutoTabsScaffold(
      routes: const [
        MerchantHomeRoute(),
        MerchantBookingsRoute(),
        ChatListRoute(),
        MerchantProfileRoute(),
***REMOVED***
      homeIndex: 0,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () ***REMOVED******REMOVED***,
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add, color: AppColors.whiteColor),
      ),
      bottomNavigationBuilder: (context, tabsRouter) => BottomNavigationBar(
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***
