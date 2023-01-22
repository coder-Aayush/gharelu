import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/enum/order_type.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/providers/product_provider.dart';
import 'package:gharelu/src/home/providers/service_category_provider.dart';
import 'package:gharelu/src/home/widgets/search_services.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MerchantHomeView extends ConsumerStatefulWidget ***REMOVED***
  const MerchantHomeView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  _MerchantHomeViewState createState() => _MerchantHomeViewState();
***REMOVED***

class _MerchantHomeViewState extends ConsumerState<MerchantHomeView> ***REMOVED***
***REMOVED***
  void initState() ***REMOVED***
    ref.read(productStateProvider.notifier).getProducts(merchantOnly: true);
    super.initState();
  ***REMOVED***

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
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
          Consumer(
            builder: (context, ref, child) ***REMOVED***
              final _state = ref.watch(productStateProvider);
              return _state.maybeWhen(
                orElse: () => Container().toSliverBox,
                loading: () => SizedBox(
                  height: context.height * 0.6,
                  child: context.loader,
                ).toSliverBox,
                error: (message) => Center(child: Text(message)).toSliverBox,
                success: (data) ***REMOVED***
                  if (data.isEmpty) ***REMOVED***
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
                  ***REMOVED*** else ***REMOVED***
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => ProductTile(
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
                  ***REMOVED***
                ***REMOVED***,
              );
            ***REMOVED***,
          )
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***
