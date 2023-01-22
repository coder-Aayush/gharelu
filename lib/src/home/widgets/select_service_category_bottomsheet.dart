import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/models/category_model.dart';
import 'package:gharelu/src/home/models/service_model.dart';
import 'package:gharelu/src/home/providers/service_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectServiceCategoryBottomsheet extends StatelessWidget ***REMOVED***
  const SelectServiceCategoryBottomsheet(***REMOVED***Key? key***REMOVED***) : super(key: key);
***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BottomSheetHeader(title: 'Select Service'),
        10.verticalSpace,
        Consumer(builder: (context, ref, _) ***REMOVED***
          return ref.watch(categoriesStateProvider).maybeWhen(
                orElse: () => Container(),
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (data) ***REMOVED***
                  return Wrap(
                    runSpacing: 20,
                    spacing: 26,
                    children: List.generate(
                      data.length,
                      (index) => GestureDetector(
                        onTap: () ***REMOVED***
                          Navigator.pop(context, data[index]);
                        ***REMOVED***,
                        child: Column(
                          children: [
                            GradientCircle(
                              child:
                                  CacheImageViewer(imageUrl: data[index].image),
                              showGradient: true,
                              radius: 40,
                            ),
                            2.verticalSpace,
                            Text(
                              data[index].name,
                              style: AppStyles.text10PxBold.softBlack,
                            ),
                    ***REMOVED***
                        ),
                      ),
                    ),
                  ).px(20.w);
                ***REMOVED***,
              );
        ***REMOVED***),
        40.verticalSpace,
***REMOVED***
    );
  ***REMOVED***

  static Future<CategoryModel?> show(BuildContext context) async ***REMOVED***
    final response = await showAppBottomSheet<CategoryModel?>(
        context, const SelectServiceCategoryBottomsheet());
    if (response != null) ***REMOVED***
      return response;
    ***REMOVED***
    return null;
  ***REMOVED***
***REMOVED***
