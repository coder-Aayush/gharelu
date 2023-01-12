import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.gr.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/providers/banner_provider.dart';
import 'package:gharelu/src/home/providers/service_provider.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget ***REMOVED***
  const HomeView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context, WidgetRef ref) ***REMOVED***
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
                onPressed: () ***REMOVED***
                  final searcher = HitsSearcher(
                    applicationID: 'IYS3NBQCDI',
                    apiKey: '3ab9dbad16ea56cdccf487e845d139a6',
                    indexName: 'services',
                  );
                  showSearch(
                    context: context,
                    delegate: CustomSearchServices(searcher),
                  );
                ***REMOVED***,
              ),
            ),
          ),
          20.verticalSpace.toSliverBox,
          Consumer(builder: (context, ref, _) ***REMOVED***
            final bannersState = ref.watch(bannerStateProvider);
            return bannersState.maybeWhen(
              orElse: () => Container().toSliverBox,
              success: (data) ***REMOVED***
                if (data.isEmpty) ***REMOVED***
                  return const SizedBox.shrink().toSliverBox;
                ***REMOVED*** else ***REMOVED***
                  return Column(
                    children: [
                      CustomCarousel(banners: data),
                      30.verticalSpace,
              ***REMOVED***
                  ).toSliverBox;
                ***REMOVED***
              ***REMOVED***,
              error: (message) => Center(child: Text(message)).toSliverBox,
              loading: () => const CarouselShimmer().px(20.w).toSliverBox,
            );
          ***REMOVED***),
          Consumer(
            builder: (context, ref, _) ***REMOVED***
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
            ***REMOVED***,
          ),
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***
