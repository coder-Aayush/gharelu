import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/models/category_model.dart';
import 'package:gharelu/src/home/models/service_model.dart';
import 'package:gharelu/src/home/providers/service_category_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductCategoryBottomsheet extends StatefulHookConsumerWidget ***REMOVED***
  const ProductCategoryBottomsheet(***REMOVED***Key? key, required this.category***REMOVED***)
      : super(key: key);
  final CategoryModel category;

***REMOVED***
  _ProductCategoryBottomsheetState createState() =>
      _ProductCategoryBottomsheetState();

  static Future<ServiceModel?> show(BuildContext context,
      ***REMOVED***required CategoryModel category***REMOVED***) async ***REMOVED***
    final response = await showAppBottomSheet<ServiceModel?>(
      context,
      ProductCategoryBottomsheet(category: category),
    );
    if (response != null) ***REMOVED***
      return response;
    ***REMOVED***
    return null;
  ***REMOVED***
***REMOVED***

class _ProductCategoryBottomsheetState
    extends ConsumerState<ProductCategoryBottomsheet> ***REMOVED***
***REMOVED***
  void didChangeDependencies() ***REMOVED***
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) ***REMOVED***
      ref
          .read(serviceCategoryStateProvider.notifier)
          .getServices(categoryId: widget.category.id);
  ***REMOVED***
    super.didChangeDependencies();
  ***REMOVED***

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BottomSheetHeader(title: 'Select $***REMOVED***widget.category.name***REMOVED*** Category'),
        Column(
          children: [
            ref.watch(serviceCategoryStateProvider).maybeWhen(
                  orElse: Container.new,
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  success: (data) => Wrap(
                    runSpacing: 30,
                    spacing: 24,
                    children: List.generate(
                      data.length,
                      (index) => GestureDetector(
                        onTap: () => Navigator.pop(context, data[index]),
                        child: Column(
                          children: [
                            GradientCircle(
                              child: CacheImageViewer(
                                imageUrl: data[index].image,
                              ),
                            ),
                            2.verticalSpace,
                            Text(data[index].name),
                    ***REMOVED***
                        ),
                      ),
                    ),
                  ),
                )
    ***REMOVED***
        ),
        40.verticalSpace,
***REMOVED***
    );
  ***REMOVED***
***REMOVED***
