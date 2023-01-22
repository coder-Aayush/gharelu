import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/providers/delete_product_provider.dart';
import 'package:gharelu/src/home/providers/product_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeleteProductBottomsheet extends ConsumerWidget ***REMOVED***
  const DeleteProductBottomsheet(***REMOVED***Key? key, required this.productId***REMOVED***)
      : super(key: key);

  final String productId;

***REMOVED***
  Widget build(BuildContext context, WidgetRef ref) ***REMOVED***
    ref.listen<AppState>(deleteProductNotifierProvider, (previous, next) ***REMOVED***
      next.maybeWhen(
        orElse: () => null,
        success: (data) ***REMOVED***
          context.showSnackbar(message: 'Product Deleted');
          ref
              .read(productStateProvider.notifier)
              .getProducts(merchantOnly: true);
          context.router.popUntil(
            (route) => route.settings.name == MerchantDashboardRouter.name,
          );
        ***REMOVED***,
      );
  ***REMOVED***
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BottomSheetHeader(title: 'Delete Product'),
        Column(
          children: [
            Text(
              'Are you Sure you want to Delete this Product? You will not receive offers after Deleting this Product',
              style: AppStyles.text14PxMedium.copyWith(
                color: AppColors.softBlack.withOpacity(.5),
              ),
              textAlign: TextAlign.center,
            ),
            20.verticalSpace,
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                  isDisabled: false,
                  title: 'Cancel',
                  onPressed: () => Navigator.pop(context),
                )),
                const Spacer(),
                Expanded(
                    child: CustomButton(
                  backgroundColor: AppColors.errorColor,
                  title: 'Delete',
                  isDisabled: false,
                  loading: ref.watch(deleteProductNotifierProvider).maybeWhen(
                        orElse: () => false,
                        loading: () => true,
                      ),
                  onPressed: () => ref
                      .read(deleteProductNotifierProvider.notifier)
                      .deleteProduct(productId),
                )),
        ***REMOVED***
            ),
            20.verticalSpace,
    ***REMOVED***
        ).px(20.w),
***REMOVED***
    );
  ***REMOVED***

  static Future<void> show(BuildContext context, ***REMOVED***required String productId***REMOVED***) =>
      showAppBottomSheet(
          context, DeleteProductBottomsheet(productId: productId));
***REMOVED***
