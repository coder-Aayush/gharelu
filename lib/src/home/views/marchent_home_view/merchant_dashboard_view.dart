import 'package:flutter/material.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/home/providers/get_user_info_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MerchantDashboardView extends StatefulHookConsumerWidget {
  const MerchantDashboardView({Key? key}) : super(key: key);

  @override
  _MerchantDashboardViewState createState() => _MerchantDashboardViewState();
}

class _MerchantDashboardViewState extends ConsumerState<MerchantDashboardView> {
  @override
  void didChangeDependencies() {
    ref.read(authChangeProvider);
    final userId = ref.read(firebaseAuthProvider).currentUser?.uid;
    Future.delayed(
      const Duration(milliseconds: 200),
      () => ref
          .read(getUserInfoNotifiderProvider.notifier)
          .getUserInfo(id: userId!, isMerchant: true),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        const MerchantHomeRoute(),
        const MerchantBookingsRoute(),
        ChatListRoute(isMerchant: true),
        ProfileRoute(
          onAppoinment: () =>
              context.router.root.innerRouterOf(MerchantDashboardRouter.name)
                ?..innerRouterOf<TabsRouter>(MerchantDashboardRouter.name)
                    ?.setActiveIndex(1)
                ..navigate(const MerchantBookingsRoute()),
        ),
      ],
      homeIndex: 0,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.router.push(CreateProductRoute()),
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
        ],
      ),
    );
  }
}
