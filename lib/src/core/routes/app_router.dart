export 'package:auto_route/auto_route.dart';

export 'app_router.gr.dart';

import 'package:auto_route/auto_route.dart';
import 'package:gharelu/src/app/views/views.dart';
import 'package:gharelu/src/auth/view/pages.dart';
import 'package:gharelu/src/home/views/pages.dart';
import 'package:gharelu/src/map_view/views/views.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    AutoRoute<void>(page: SplashView, initial: true),
    AutoRoute<void>(page: LoginChoiceView),
    AutoRoute<void>(page: UserSignupView),
    AutoRoute<void>(page: LoginUserView),
    AutoRoute<void>(page: MerchantSignupView),
    AutoRoute<void>(page: MerchantLoginView),
    AutoRoute<void>(page: WelcomeView),

    // map
    AutoRoute<void>(page: MapPickerView),

    // user home
    AutoRoute<void>(
      page: DashboardView,
      path: 'dashboard',
      name: 'DashboardRouter',
      children: [
        AutoRoute(
          page: HomeView,
          path: '',
          name: 'HomeRouter',
        ),
        AutoRoute(
          page: AppointmentView,
          path: 'bookmark',
          name: 'AppointmentRouter',
        ),
        AutoRoute(
          page: ChatListView,
          path: 'chat',
          name: 'ChatRouter',
        ),
        AutoRoute(
          page: ProfileView,
          path: 'profile',
          name: 'ProfileRouter',
        ),
***REMOVED***
    ),
    AutoRoute<void>(page: CategoryView),

    // chats
    AutoRoute<void>(page: ChatDetailView),
    AutoRoute<void>(page: ProductView),
    AutoRoute<void>(page: ProductSummaryView),
    AutoRoute<void>(page: SelectSlotView),
    AutoRoute<void>(page: CheckoutView),
    AutoRoute<void>(page: HelpAndSupportView),
    AutoRoute<void>(page: ProfileInfoView),
***REMOVED***
)
class $AppRouter ***REMOVED******REMOVED***
