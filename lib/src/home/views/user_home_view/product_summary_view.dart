import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/widget_extension.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/models/service_model.dart';
import 'package:gharelu/src/home/providers/cart_provider.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';

@RoutePage<void>()
class ProductSummaryView extends StatelessWidget {
  const ProductSummaryView({Key? key, required this.service}) : super(key: key);
  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      bottomNavigationBar: Consumer(
        builder: (context, ref, _) {
          final _cart = ref.watch(cartStateProvider);
          if (_cart.products.isNotEmpty) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: AppColors.primaryColor.withOpacity(.2),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Summary',
                    style: AppStyles.text16PxMedium,
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      Text('Item Total', style: AppStyles.text14PxMedium),
                      const Spacer(),
                      Text('Rs: ${_cart.totalPrice}',
                          style: AppStyles.text14PxSemiBold)
                    ],
                  ),
                  22.verticalSpace,
                  Row(
                    children: [
                      Text('Convenience Fee', style: AppStyles.text14PxMedium),
                      const Spacer(),
                      Text('Rs: 50', style: AppStyles.text14PxSemiBold)
                    ],
                  ),
                  20.verticalSpace,
                  const Divider(),
                  10.verticalSpace,
                  Row(
                    children: [
                      Text('Total', style: AppStyles.text14PxMedium),
                      const Spacer(),
                      Text(
                        'Rs: ${_cart.subTotal}',
                        style: AppStyles.text14PxSemiBold,
                      )
                    ],
                  ),
                  20.verticalSpace,
                  Center(
                    child: CustomButton(
                      title: 'Select Slot',
                      isDisabled: !_cart.products.isNotEmpty,
                      onPressed: () => context.router
                          .push(SelectSlotRoute(service: service)),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const AutoLeadingButton(color: AppColors.whiteColor),
            backgroundColor: AppColors.primaryColor,
            title: Text(
              'Summary',
              style: AppStyles.text20PxBold.white,
            ),
            floating: true,
          ),
          Consumer(builder: (context, ref, _) {
            final cart = ref.watch(cartStateProvider);
            if (cart.products.isEmpty) {
              return Container(
                height: MediaQuery.of(context).size.height * .85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No Product in Cart',
                      style: AppStyles.text20PxSemiBold,
                    ),
                    20.verticalSpace,
                    CustomButton(
                      title: 'Shop More',
                      onPressed: () => context.router.pop(),
                      isDisabled: false,
                    ),
                  ],
                ),
              ).toSliverBox;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Carts', style: AppStyles.text18PxMedium.softBlack),
                12.verticalSpace,
                ...List.generate(cart.products.length, (index) {
                  final product = cart.products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text(
                        'Rs: ${calculateTotalPriceOfProduct(product.price, product.quantity)}'),
                    trailing: IncrementAndDecrement(
                      count: product.quantity,
                      onIncrement: () => ref
                          .read(cartStateProvider.notifier)
                          .increment(product),
                      onDecrement: () => ref
                          .read(cartStateProvider.notifier)
                          .decrement(product),
                    ),
                  );
                }),
              ],
            ).px(20).py(20).toSliverBox;
          }),
        ],
      ),
    );
  }

  int calculateTotalPriceOfProduct(int amount, int quantity) {
    return amount * quantity;
  }
}
