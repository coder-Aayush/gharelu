import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gharelu/src/core/assets/assets.gen.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/extensions/extensions.dart';
import 'package:gharelu/src/core/routes/app_router.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/core/theme/app_colors.dart';
import 'package:gharelu/src/core/theme/app_styles.dart';
import 'package:gharelu/src/core/widgets/widgets.dart';
import 'package:gharelu/src/home/models/product_model.dart';
import 'package:gharelu/src/home/providers/create_product_provider.dart';
import 'package:gharelu/src/home/providers/forms/create_product_form_provider.dart';
import 'package:gharelu/src/home/providers/product_provider.dart';
import 'package:gharelu/src/home/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:gharelu/src/home/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class CreateProductView extends HookConsumerWidget ***REMOVED***
  const CreateProductView(***REMOVED***Key? key, this.editProduct***REMOVED***) : super(key: key);
  final ProductModel? editProduct;

***REMOVED***
  Widget build(BuildContext context, WidgetRef ref) ***REMOVED***
    final productName = useTextEditingController();
    final productDescription = useTextEditingController();
    final priceController = useTextEditingController();
    final quanity = useTextEditingController();
    final category = useTextEditingController();
    final service = useTextEditingController();

    ***REMOVED***Listeners
    ///
    ///
    useEffect(() ***REMOVED***
      if (editProduct != null) ***REMOVED***
        ref
            .read(createProductFormNotifierProvider.notifier)
            .setProduct(editProduct!);
        productName.text = editProduct!.name;
        productDescription.text = editProduct!.description;
        priceController.text = editProduct!.price.toString();
        quanity.text = editProduct!.quantity.toString();
        category.text = editProduct?.category?.name ?? '';
        service.text = editProduct?.service?.name ?? '';
      ***REMOVED***
      return null;
    ***REMOVED***, []);

    final form = ref.watch(createProductFormNotifierProvider).form;

    ref.listen<AppState>(createProductNotifierProvider, (previous, next) ***REMOVED***
      next.maybeWhen(
        orElse: () => null,
        success: (data) ***REMOVED***
          context.router.pop();
          context.router.root.innerRouterOf(MerchantDashboardRouter.name)
            ?..innerRouterOf<TabsRouter>(MerchantDashboardRouter.name)
                ?.setActiveIndex(0)
            ..navigate(const MerchantHomeRoute());
          ref
              .refresh(productStateProvider.notifier)
              .getProducts(merchantOnly: true);
          context.showSnackbar(message: 'Product Created!');
        ***REMOVED***,
        error: (message) => context.showErorDialog(message: message),
      );
  ***REMOVED***

    return ScaffoldWrapper(
      appBar: AppBar(
        title: Text(editProduct != null ? 'Edit Product' : 'Create Product'),
        actions: [
          if (editProduct != null)
            IconButton(
                onPressed: () => DeleteProductBottomsheet.show(context,
                    productId: editProduct!.id),
                icon: Assets.icons.deleteIcon.svg()),
  ***REMOVED***
      ),
      bottomNavigationBar: BottomAppBar(
        child: CustomButton(
          title: 'Submit',
          onPressed: () ***REMOVED***
            final now = DateTime.now().millisecondsSinceEpoch;
            ref.read(createProductNotifierProvider.notifier).createProduct(
                  ProductModel.empty().copyWith(
                    name: form.productName.value,
                    category: form.category,
                    id: editProduct?.id ?? '',
                    categoryId: form.categoryId,
                    description: form.description.value,
                    price: int.parse(form.price.value),
                    quantity: int.parse(form.maxQuality.value),
                    unPublish: form.publish,
                    serviceId: form.serviceId,
                    updatedAt: now,
                    merchantId: form.merchantId,
                    image: form.imageUrl,
                    service: form.service,
                  ),
                  image: form.fileImage?.value != null
                      ? File(form.fileImage!.value)
                      : null,
                  update: editProduct != null,
                );
          ***REMOVED***,
          loading: ref.watch(createProductNotifierProvider).maybeWhen(
                orElse: () => false,
                loading: () => true,
              ),
          isDisabled: !(form.isValid),
        ).px(20.w).py(10.h),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.verticalSpace,
            Text(
              'Let\'s start your Product to Gharelu App. Complete basic Information and you are Ready to Accept Offers',
              style: AppStyles.text14PxMedium
                  .copyWith(color: AppColors.softBlack.withOpacity(.5)),
            ),
            20.verticalSpace,
            Consumer(builder: (context, ref, _) ***REMOVED***
              return GestureDetector(
                onTap: () async ***REMOVED***
                  final picker = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (picker != null) ***REMOVED***
                    ref
                        .read(createProductFormNotifierProvider.notifier)
                        .setImage(File(picker.path));
                  ***REMOVED***
                ***REMOVED***,
                child: Stack(
                  children: [
                    GradientCircle(
                      showGradient: true,
                      radius: 90,
                      child: Consumer(builder: (context, ref, _) ***REMOVED***
                        if (form.imageUrl.isNotEmpty) ***REMOVED***
                          return CacheImageViewer(imageUrl: form.imageUrl);
                        ***REMOVED***
                        if (form.fileImage?.value != null) ***REMOVED***
                          return Image.file(File(form.fileImage!.value),
                              fit: BoxFit.cover);
                        ***REMOVED***
                        return Opacity(
                          opacity: .4,
                          child: Assets.images.market.image(),
                        );
                      ***REMOVED***),
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 0,
                      child: GradientCircle(
                        showGradient: true,
                        radius: 30,
                        child: Icon(Icons.add),
                      ),
                    ),
            ***REMOVED***
                ),
              );
            ***REMOVED***),
            20.verticalSpace,
            CustomTextField(
              labelText: 'Product Name',
              controller: productName,
              textInputType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              onChanged: (value) => ref
                  .read(createProductFormNotifierProvider.notifier)
                  .setName(value),
              error: form.productName.errorMessage,
              warning: form.productName.warningMessage,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9-()***REMOVED******REMOVED*** ]')),
        ***REMOVED***
              maxLength: 100,
            ),
            20.verticalSpace,
            CustomTextField(
              maxLines: 4,
              labelText: 'Product Description',
              controller: productDescription,
              maxLength: 300,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9-()***REMOVED******REMOVED*** ]')),
        ***REMOVED***
              onChanged: (value) => ref
                  .read(createProductFormNotifierProvider.notifier)
                  .setProductDescription(value),
              error: form.description.errorMessage,
              textCapitalization: TextCapitalization.sentences,
            ),
            20.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    labelText: 'Price (in RS)',
                    controller: priceController,
                    maxLength: 4,
                    onChanged: (value) => ref
                        .read(createProductFormNotifierProvider.notifier)
                        .setPrice(value),
                    error: form.price.errorMessage,
                    warning: form.price.warningMessage,
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ***REMOVED***
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    labelText: 'Max Quantity',
                    controller: quanity,
                    maxLength: 3,
                    onChanged: (value) => ref
                        .read(createProductFormNotifierProvider.notifier)
                        .setQuantity(value),
                    textInputType: TextInputType.number,
                    error: form.maxQuality.errorMessage,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ***REMOVED***
                  ).pOnly(left: 30.w),
                ),
        ***REMOVED***
            ),
            20.verticalSpace,
            CustomTextField(
              readOnly: true,
              labelText: 'Product Services',
              controller: category,
              onTap: () async ***REMOVED***
                final response =
                    await SelectServiceCategoryBottomsheet.show(context);
                if (response != null) ***REMOVED***
                  ref
                      .read(createProductFormNotifierProvider.notifier)
                      .setService(response);
                  category.text = response.name;
                ***REMOVED***
              ***REMOVED***,
            ),
            20.verticalSpace,
            GestureDetector(
              onTap: () ***REMOVED***
                if (form.category.id.isEmpty) ***REMOVED***
                  context.showSnackbar(
                      message: 'Select Product Category First');
                ***REMOVED***
              ***REMOVED***,
              child: CustomTextField(
                readOnly: true,
                isEnable: form.category.id.isNotEmpty,
                labelText: 'Product Category',
                controller: service,
                onTap: () async ***REMOVED***
                  final response = await ProductCategoryBottomsheet.show(
                      context,
                      category: form.category);
                  if (response != null) ***REMOVED***
                    ref
                        .read(createProductFormNotifierProvider.notifier)
                        .setCategory(response);
                    service.text = response.name;
                  ***REMOVED***
                ***REMOVED***,
              ),
            ),
            20.verticalSpace,
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: SwitchListTile(
                value: form.publish,
                activeColor: AppColors.primaryColor,
                onChanged: (value) => ref
                    .read(createProductFormNotifierProvider.notifier)
                    .publish(value),
                title: const Text('Publish'),
              ),
            ),
            10.verticalSpace,
            AnimatedOpacity(
              opacity: !form.publish ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 700),
              child: !form.publish
                  ? Text(
                      'Your product will be unpublished and you will not receive any offers. Publish your Product to Receive Offers.',
                      style: AppStyles.text10PxMedium
                          .copyWith(color: AppColors.softBlack.withOpacity(.5)),
                    )
                  : const SizedBox.shrink(),
            ),
            30.verticalSpace,
    ***REMOVED***
        ).px(20.w),
      ),
    );
  ***REMOVED***
***REMOVED***
