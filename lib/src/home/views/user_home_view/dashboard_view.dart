import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage(name: 'DashboardRouter')
class DashboardView extends StatefulHookConsumerWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  @override
  Widget build(BuildContext context) {
    ref.read(authChangeProvider);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AutoTabsScaffold(
        routes: [
          const HomeRouter(),
          const AppointmentRouter(),
          ChatRouter(isMerchant: false),
          ProfileRouter(
            onAppoinment: () =>
                context.router.root.innerRouterOf(DashboardRouter.name)
                  ?..innerRouterOf<TabsRouter>(DashboardRouter.name)
                      ?.setActiveIndex(1)
                  ..navigate(const AppointmentRouter()),
          ),
        ],
        bottomNavigationBuilder: (context, tabsRouter) {
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
            ],
          );
        },
      ),
    );
  }
}
