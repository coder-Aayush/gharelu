import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/theme/theme.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/models/category_model.dart';
import 'package:gharelu/src/home/providers/service_category_provider.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryView extends StatefulHookConsumerWidget {
  const CategoryView({Key? key, required this.category}) : super(key: key);

  final CategoryModel category;

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends ConsumerState<CategoryView> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(serviceCategoryStateProvider.notifier)
          .getServices(categoryId: widget.category.id);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const AutoLeadingButton(color: AppColors.whiteColor),
            backgroundColor: AppColors.primaryColor,
            title: Text(
              widget.category.name,
              style: AppStyles.text20PxBold.white,
            ),
            floating: true,
          ),
          20.verticalSpace.toSliverBox,
          Consumer(
            builder: (context, ref, child) {
              final _state = ref.watch(serviceCategoryStateProvider);
              return _state.maybeWhen(
                orElse: () => Container().toSliverBox,
                loading: () => context.loader.toSliverBox,
                success: (data) => SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => CustomProductCard(
                      image: data[index].image,
                      name: data[index].name,
                      onPressed: () => context.router.push(ProductRoute(
                        categoryId: data[index].id,
                        serviceId: data[index].id,
                        image: data[index].image,
                        title: data[index].name,
                        service: data[index],
                      )),
                    ).px(10.w),
                    childCount: data.length,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
