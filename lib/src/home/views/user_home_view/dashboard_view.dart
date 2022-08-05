***REMOVED***

import 'package:flutter/material.dart';
import 'package:gharelu/src/core/routes/app_router.dart';

class DashboardView extends StatelessWidget ***REMOVED***
  const DashboardView(***REMOVED***Key? key***REMOVED***) : super(key: key);

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
