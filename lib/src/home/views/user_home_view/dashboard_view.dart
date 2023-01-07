***REMOVED***

import 'package:flutter/material.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/services/notification_service.dart';
import 'package:gharelu/src/home/providers/banner_provider.dart';
import 'package:gharelu/src/home/providers/service_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardView extends StatefulHookConsumerWidget ***REMOVED***
  const DashboardView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  _DashboardViewState createState() => _DashboardViewState();
***REMOVED***

class _DashboardViewState extends ConsumerState<DashboardView> ***REMOVED***
***REMOVED***
  void didChangeDependencies() ***REMOVED***
    ref.read(bannerStateProvider.notifier).getBanners();
    ref.read(categoriesStateProvider.notifier).getServices();
    print(ref.watch(authChangeProvider).asData?.value);
    super.didChangeDependencies();
  ***REMOVED***

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return WillPopScope(
      onWillPop: () async ***REMOVED***
        return false;
      ***REMOVED***,
      child: AutoTabsScaffold(
        routes: [
          const HomeRouter(),
          const AppointmentRouter(),
          const ChatRouter(),
          const ProfileRouter(),
  ***REMOVED***
        builder: (context, child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        bottomNavigationBuilder: (context, tabsRouter) ***REMOVED***
          return BottomNavigationBar(
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
                label: 'Appointments',
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
          );
        ***REMOVED***,
      ),
    );
  ***REMOVED***
***REMOVED***
