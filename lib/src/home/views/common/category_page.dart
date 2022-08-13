import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/models/service_model.dart';
import 'package:gharelu/src/home/providers/service_category_provider.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryView extends StatefulHookConsumerWidget ***REMOVED***
  const CategoryView(***REMOVED***Key? key, required this.service***REMOVED***) : super(key: key);

  final ServiceModel service;

***REMOVED***
  _CategoryViewState createState() => _CategoryViewState();
***REMOVED***

class _CategoryViewState extends ConsumerState<CategoryView> ***REMOVED***
***REMOVED***
  void initState() ***REMOVED***
    super.initState();
    ref
        .read(serviceCategoryStateProvider.notifier)
        .getCategories(serviceId: widget.service.id);
  ***REMOVED***

***REMOVED***
  Widget build(BuildContext context) ***REMOVED***
    return ScaffoldWrapper(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const AutoLeadingButton(color: AppColors.whiteColor),
            backgroundColor: AppColors.primaryColor,
            title: Text(
              widget.service.name,
              style: AppStyles.text20PxBold.white,
            ),
            floating: true,
          ),
          20.verticalSpace.toSliverBox,
          Consumer(
            builder: (context, ref, child) ***REMOVED***
              final _state = ref.watch(serviceCategoryStateProvider);
              return _state.maybeWhen(
                orElse: () => Container().toSliverBox,
                success: (data) => SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => CustomProductCard(
                      image: data[index].image,
                      discount: data[index].discount,
                      name: data[index].name,
                      onPressed: () ***REMOVED******REMOVED***,
                    ).px(10.w),
                    childCount: data.length,
                  ),
                ),
              );
            ***REMOVED***,
          )
  ***REMOVED***
      ),
    );
  ***REMOVED***
***REMOVED***
