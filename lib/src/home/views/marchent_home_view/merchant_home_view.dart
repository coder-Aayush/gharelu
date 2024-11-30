import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/providers/product_provider.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MerchantHomeView extends ConsumerStatefulWidget {
  const MerchantHomeView({Key? key}) : super(key: key);

  @override
  _MerchantHomeViewState createState() => _MerchantHomeViewState();
}

class _MerchantHomeViewState extends ConsumerState<MerchantHomeView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 200),
      () => ref
          .read(productStateProvider.notifier)
          .getProducts(merchantOnly: true),
    );
    super.initState();
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
            // flexibleSpace: FlexibleSpaceBar(
            //   background: SearchBar(
            //     onPressed: () {
            //       final searcher = HitsSearcher(
            //         applicationID: 'IYS3NBQCDI',
            //         apiKey: '3ab9dbad16ea56cdccf487e845d139a6',
            //         indexName: 'services',
            //       );
            //       showSearch(
            //         context: context,
            //         delegate: CustomSearchServices(searcher),
            //       );
            //     },
            //   ),
            // ),
          ),
          20.verticalSpace.toSliverBox,
          Consumer(
            builder: (context, ref, child) {
              final _state = ref.watch(productStateProvider);
              return _state.maybeWhen(
                orElse: () => Container().toSliverBox,
                loading: () => SizedBox(
                  height: context.height * 0.6,
                  child: context.loader,
                ).toSliverBox,
                error: (message) => Center(child: Text(message)).toSliverBox,
                success: (data) {
                  if (data.isEmpty) {
                    return Center(
                      child: SizedBox(
                        height: context.height * 0.6,
                        child: NoDataFound(
                          title: 'No Services Found',
                          onRefresh: () => ref
                              .read(productStateProvider.notifier)
                              .getProducts(merchantOnly: true),
                        ),
                      ),
                    ).toSliverBox;
                  } else {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => ProductTile(
                          id: data[index].id,
                          image: data[index].image,
                          name: data[index].name,
                          price: data[index].price,
                          onButtomPressed: () => context.router.push(
                            CreateProductRoute(
                              editProduct: data[index],
                            ),
                          ),
                          description: data[index].description,
                          buttonTitle: 'Edit',
                        ).px(20.w).py(10.h),
                        childCount: data.length,
                      ),
                    );
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
