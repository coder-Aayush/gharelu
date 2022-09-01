***REMOVED***

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/providers/product_provider.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductView extends StatefulHookConsumerWidget ***REMOVED***
  const ProductView(
      ***REMOVED***Key? key,
      required this.categoryId,
      required this.serviceId,
      required this.image,
      required this.title***REMOVED***)
      : super(key: key);
  final String categoryId;
  final String serviceId;
  final String image;
  final String title;

***REMOVED***
  _ProductViewState createState() => _ProductViewState();
***REMOVED***

class _ProductViewState extends ConsumerState<ProductView> ***REMOVED***
***REMOVED***
  void initState() ***REMOVED***
    if (mounted) ***REMOVED***
      Future.delayed(
        Duration.zero,
        () => ref.read(productStateProvider.notifier).getProducts(
            categoryId: widget.categoryId, serviceId: widget.serviceId),
      );
    ***REMOVED***
    super.initState();
  ***REMOVED***

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return ScaffoldWrapper(
      bottomNavigationBar: BottomAppBar(
        color: AppColors.primaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Total: Rs 2000', style: AppStyles.text14PxBold.white),
            const Spacer(),
            CustomButton(
              title: 'View Cart',
              onPressed: () ***REMOVED******REMOVED***,
              isDisabled: false,
              backgroundColor: AppColors.whiteColor,
              titleStyle: AppStyles.text14PxBold.primary,
              height: 45,
            ),
    ***REMOVED***
        ).px(20).py(10),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const AutoLeadingButton(color: AppColors.whiteColor),
            backgroundColor: AppColors.primaryColor,
            title: Text(
              widget.title,
              style: AppStyles.text20PxBold.white,
            ),
            floating: true,
          ),
          10.verticalSpace.toSliverBox,
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CacheImageViewer(
              imageUrl: widget.image,
              height: 200.h,
            ),
          ).px(10).toSliverBox,
          20.verticalSpace.toSliverBox,
          ref.watch(productStateProvider).maybeWhen(
                orElse: () => Container().toSliverBox,
                success: (data) => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ProductTile(
                      name: data[index].name,
                      description: data[index].description,
                      image: data[index].image,
                      onDecrement: () ***REMOVED******REMOVED***,
                      onIncrement: () ***REMOVED******REMOVED***,
                      price: data[index].price,
                    ).px(10).py(14),
                    childCount: data.length,
                  ),
                ),
                loading: () => const Center(child: CircularProgressIndicator())
                    .toSliverBox,
                error: (message) => Center(
                  child: Text(message, style: AppStyles.text14PxMedium),
                ).toSliverBox,
              ),
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***
