import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/core/routes/app_router.gr.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/providers/banner_provider.dart';
import 'package:gharelu/src/home/providers/get_user_info_provider.dart';
import 'package:gharelu/src/home/providers/service_provider.dart';
import 'package:gharelu/src/home/widgets/search_services.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends StatefulHookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final currentUser = ref.read(firebaseAuthProvider).currentUser;
      ref.read(getUserInfoNotifiderProvider.notifier).getUserInfo(id: currentUser?.uid ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.primaryColor,
            title: const Text(
              'Gharelu App',
              style: TextStyle(color: AppColors.whiteColor),
            ),
            expandedHeight: 150.h,
            snap: true,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: SearchBar(
                onPressed: () {
                  final searcher = HitsSearcher(
                    applicationID: '${dotenv.env['ALGOLIA_APPLICATIONID']}',
                    apiKey: '${dotenv.env['ALGOLIA_APIKEY']}',
                    indexName: 'services',
                  );
                  showSearch(
                    context: context,
                    delegate: CustomSearchServices(searcher),
                  );
                },
              ),
            ),
          ),
          20.verticalSpace.toSliverBox,
          Consumer(builder: (context, ref, _) {
            final bannersState = ref.watch(bannerStateProvider);
            return bannersState.maybeWhen(
              orElse: () => Container().toSliverBox,
              success: (data) {
                if (data.isEmpty) {
                  return const SizedBox.shrink().toSliverBox;
                } else {
                  return Column(
                    children: [
                      CustomCarousel(banners: data),
                      30.verticalSpace,
                    ],
                  ).toSliverBox;
                }
              },
              error: (message) => Center(child: Text(message)).toSliverBox,
              loading: () => const CarouselShimmer().px(20.w).toSliverBox,
            );
          }),
          Consumer(
            builder: (context, ref, _) {
              final serviceState = ref.watch(categoriesStateProvider);
              return serviceState.maybeWhen(
                orElse: () => Container().toSliverBox,
                loading: () => context.loader.toSliverBox,
                success: (data) => SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => CustomProductCard(
                      image: data[index].image,
                      name: data[index].name,
                      onPressed: () => context.router.push(
                        CategoryRoute(category: data[index]),
                      ),
                    ).px(8.w),
                    childCount: data.length,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
