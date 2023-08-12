export 'package:auto_route/auto_route.dart';

export 'app_router.gr.dart';

import 'package:auto_route/auto_route.dart';
import 'package:gharelu/src/core/routes/app_router.gr.dart';
import 'package:gharelu/src/chat/views/views.dart';

@AutoRouterConfig(
  replaceInRouteName: 'View,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: LoginChoiceRoute.page),
    AutoRoute(page: UserSignupRoute.page),
    AutoRoute(page: LoginUserRoute.page),
    AutoRoute(page: MerchantSignupRoute.page),
    AutoRoute(page: MerchantLoginRoute.page),
    AutoRoute(page: WelcomeRoute.page),
    AutoRoute(page: MapPickerRoute.page),
    AutoRoute(page: DashboardRouter.page, path: '/dashboard', children: [
      AutoRoute(page: HomeRouter.page, path: ''),
      AutoRoute(page: AppointmentRouter.page, path: 'bookmark'),
      AutoRoute(page: ChatRouter.page, path: 'chat'),
      AutoRoute(page: ProfileRouter.page, path: 'profile'),
    ]),
    AutoRoute(page: CategoryRoute.page),
    AutoRoute(page: ChatDetailRoute.page),
    AutoRoute(page: ProductRoute.page),
    AutoRoute(page: ProductSummaryRoute.page),
    AutoRoute(page: SelectSlotRoute.page),
    AutoRoute(page: CheckoutRoute.page),
    AutoRoute(page: HelpAndSupportRoute.page),
    AutoRoute(page: ProfileInfoRoute.page),
    AutoRoute(page: MerchantDashboardRouter.page, children: [
      AutoRoute(page: MerchantHomeRoute.page),
      AutoRoute(page: MerchantBookingsRoute.page),
      AutoRoute(page: ChatRouter.page),
      AutoRoute(page: ProfileRouter.page),
    ]),
    AutoRoute(page: CreateProductRoute.page),
    AutoRoute(page: VerifyEmailRoute.page),
  ];
}
