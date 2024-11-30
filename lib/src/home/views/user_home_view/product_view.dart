import 'package:auto_route/auto_route.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/models/service_model.dart';
import 'package:gharelu/src/home/providers/cart_provider.dart';
import 'package:gharelu/src/home/providers/product_provider.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ProductView extends StatefulHookConsumerWidget {
  const ProductView({
    Key? key,
    required this.categoryId,
    required this.serviceId,
    required this.image,
    required this.title,
    required this.service,
  }) : super(key: key);
  final String categoryId;
  final String serviceId;
  final String image;
  final String title;
  final ServiceModel service;

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends ConsumerState<ProductView> {
  @override
  void initState() {
    if (mounted) {
      Future.delayed(
        Duration.zero,
        () => ref
            .read(productStateProvider.notifier)
            .getProducts(categoryId: widget.categoryId),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      bottomNavigationBar: Consumer(builder: (context, ref, _) {
        final cart = ref.watch(cartStateProvider);
        if (cart.products.isNotEmpty) {
          return BottomAppBar(
            color: AppColors.primaryColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Total: Rs ${cart.price}',
                    style: AppStyles.text14PxBold.white),
                const Spacer(),
                CustomButton(
                  title: 'View Cart',
                  onPressed: () => context.router
                      .push(ProductSummaryRoute(service: widget.service)),
                  isDisabled: false,
                  backgroundColor: AppColors.whiteColor,
                  titleStyle: AppStyles.text14PxBold.primary,
                  height: 45,
                ),
              ],
            ).px(20).py(10),
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
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
                    (context, index) {
                      final product = data[index];
                      return Consumer(
                        builder: (context, ref, _) {
                          final cart = ref.watch(cartStateProvider);
                          return ProductTile(
                            id: product.id,
                            name: product.name,
                            description: product.description,
                            image: product.image,
                            itemInCart: cart.products
                                .where((element) => element.id == product.id)
                                .isNotEmpty,
                            onButtomPressed: () {
                              final _product = cart.products.where(
                                (element) => element.id == product.id,
                              );
                              ref
                                  .read(cartStateProvider.notifier)
                                  .addToCart(product);
                            },
                            price: data[index].price,
                          ).px(10).py(14);
                        },
                      );
                    },
                    childCount: data.length,
                  ),
                ),
                loading: () => context.loader.toSliverBox,
                error: (message) => Center(
                  child: Text(message, style: AppStyles.text14PxMedium),
                ).toSliverBox,
              ),
        ],
      ),
    );
  }
}
