***REMOVED***

import 'package:flutter/material.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
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
  void initState() ***REMOVED***
    super.initState();
    ref.read(bannerStateProvider.notifier).getBanners();
    ref.read(serviceStateProvider.notifier).getServices();
  ***REMOVED***

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    log('here');
    return AutoTabsScaffold(
      routes: const [
        HomeRouter(),
        BookmarkRouter(),
        ChatRouter(),
        ProfileRouter(),
***REMOVED***
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
              icon: Icon(Icons.bookmark),
              label: 'Bookmark',
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
    );
  ***REMOVED***
***REMOVED***
