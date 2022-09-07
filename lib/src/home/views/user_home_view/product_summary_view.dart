import 'package:flutter/material.dart';
***REMOVED***
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/widget_extension.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/providers/cart_provider.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';

class ProductSummaryView extends StatelessWidget ***REMOVED***
  const ProductSummaryView(***REMOVED***Key? key***REMOVED***) : super(key: key);

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return ScaffoldWrapper(
      bottomNavigationBar: Consumer(
        builder: (context, ref, _) ***REMOVED***
          final _cart = ref.watch(cartStateProvider);
          if (_cart.products.isNotEmpty) ***REMOVED***
            return BottomAppBar(
              child: Container(
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
                        Text('Rs: 1600', style: AppStyles.text14PxSemiBold)
                ***REMOVED***
                    ),
                    22.verticalSpace,
                    Row(
                      children: [
                        Text('Convenience Fee',
                            style: AppStyles.text14PxMedium),
                        const Spacer(),
                        Text('Rs: 50', style: AppStyles.text14PxSemiBold)
                ***REMOVED***
                    ),
                    20.verticalSpace,
                    const Divider(),
                    10.verticalSpace,
                    Row(
                      children: [
                        Text('Total', style: AppStyles.text14PxMedium),
                        const Spacer(),
                        Text('Rs: 1650', style: AppStyles.text14PxSemiBold)
                ***REMOVED***
                    ),
                    20.verticalSpace,
                    Center(
                      child: CustomButton(
                        title: 'Select Slot',
                        isDisabled: !_cart.products.isNotEmpty,
                        onPressed: () =>
                            context.router.push(const SelectSlotRoute()),
                      ),
                    ),
            ***REMOVED***
                ),
              ),
            );
          ***REMOVED*** else ***REMOVED***
            return const SizedBox.shrink();
          ***REMOVED***
        ***REMOVED***,
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
          Consumer(builder: (context, ref, _) ***REMOVED***
            final cart = ref.watch(cartStateProvider);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Carts', style: AppStyles.text20PxMedium.softBlack),
                ...List.generate(cart.products.length, (index) ***REMOVED***
                  final product = cart.products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('Rs: $***REMOVED***product.price***REMOVED***'),
                    trailing: IncrementAndDecrement(
                      count: product.quantity,
                      onIncrement: () => ref
                          .read(cartStateProvider.notifier)
                          .increment(product),
                      onDecrement: () ***REMOVED******REMOVED***,
                    ),
                  );
                ***REMOVED***),
        ***REMOVED***
            ).px(20).py(20).toSliverBox;
          ***REMOVED***),
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***
