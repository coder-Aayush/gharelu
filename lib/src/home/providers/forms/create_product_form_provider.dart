import 'dart:io';

import 'package:gharelu/src/core/state/app_form_state.dart';
import 'package:gharelu/src/core/validations/field.dart';
import 'package:gharelu/src/home/entities/create_product_entity.dart';
import 'package:gharelu/src/home/models/category_model.dart';
import 'package:gharelu/src/home/models/product_model.dart';
import 'package:gharelu/src/home/models/service_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateProductFormNotifier
    extends StateNotifier<AppFormState<CreateProductEntity>> ***REMOVED***
  CreateProductFormNotifier()
      : super(AppFormState(CreateProductEntity.empty()));

  void setProduct(ProductModel product) ***REMOVED***
    setName(product.name);
    setProductDescription(product.description);
    setPrice(product.price.toString());
    setQuantity(product.quantity.toString());
    if (product.category != null) ***REMOVED***
      setService(product.category!);
    ***REMOVED***
    if (product.service != null) ***REMOVED***
      setCategory(product.service!);
    ***REMOVED***
    final _state = state;
    state = _state.copyWith(
        form: _state.form.copyWith(
      categoryId: product.categoryId,
      imageUrl: product.image,
      id: product.id,
      merchantId: product.merchantId,
      publish: product.unPublish,
      serviceId: product.serviceId,
    ));
  ***REMOVED***

  void setService(CategoryModel category) ***REMOVED***
    final _state = state;
    var form = state.form;
    state = _state.copyWith(
        form: form.copyWith(category: category, categoryId: category.id));
  ***REMOVED***

  void setCategory(ServiceModel service) ***REMOVED***
    final _state = state;
    var form = state.form;
    state = _state.copyWith(
      form: form.copyWith(
        service: service,
        serviceId: service.id,
      ),
    );
  ***REMOVED***

  void setName(String name) ***REMOVED***
    final _state = state;
    var form = state.form;

    if (name.trim().isEmpty) ***REMOVED***
      form = _state.form.copyWith(
        productName: Field(
          value: name,
          isValid: false,
          errorMessage: 'Product Name must be a valid name',
        ),
      );
    ***REMOVED*** else ***REMOVED***
      if (name.length <= 10 || name.length >= 60) ***REMOVED***
        print(name.length);
        form = _state.form.copyWith(
          productName: Field(
            value: name,
            isValid: true,
            warningMessage:
                'Recommended: Catchy name can be between 10 words to 60 words.',
          ),
        );
      ***REMOVED*** else ***REMOVED***
        form = _state.form
            .copyWith(productName: Field(value: name, isValid: true));
      ***REMOVED***
    ***REMOVED***
    state = state.copyWith(form: form);
  ***REMOVED***

  void setProductDescription(String description) ***REMOVED***
    final _state = state;
    var form = state.form;
    if (description.trim().isEmpty) ***REMOVED***
      form = _state.form.copyWith(
        description: Field(
          value: description,
          isValid: false,
          errorMessage: 'Discription must be a valid name',
        ),
      );
    ***REMOVED*** else ***REMOVED***
      form = _state.form.copyWith(
        description: Field(value: description, isValid: true, errorMessage: ''),
      );
    ***REMOVED***
    state = state.copyWith(form: form);
  ***REMOVED***

  void setPrice(String price) ***REMOVED***
    final _state = state;
    var form = state.form;
    if (price.isEmpty) ***REMOVED***
      form = _state.form.copyWith(
        price: Field(
          value: price,
          isValid: false,
          errorMessage: 'Price cannot be less than 50',
        ),
      );
    ***REMOVED*** else ***REMOVED***
      final _price = int.parse(price);
      if (_price < 49 || _price > 9998) ***REMOVED***
        form = _state.form.copyWith(
          price: Field(
            value: _price.toString(),
            isValid: false,
            errorMessage: 'Product Price should be between 50 to 9999',
          ),
        );
      ***REMOVED*** else ***REMOVED***
        form = _state.form.copyWith(
          price: Field(value: price, isValid: true, errorMessage: ''),
        );
      ***REMOVED***
    ***REMOVED***
    state = state.copyWith(form: form);
  ***REMOVED***

  void setQuantity(String quantity) ***REMOVED***
    final _state = state;
    var form = state.form;
    if (quantity.isEmpty) ***REMOVED***
      form = _state.form.copyWith(
        maxQuality: Field(
          value: quantity,
          isValid: false,
          errorMessage: 'Quality must be Greater than 1',
        ),
      );
    ***REMOVED*** else ***REMOVED***
      final _quantity = int.parse(quantity);
      if (_quantity < 1 || _quantity > 200) ***REMOVED***
        form = _state.form.copyWith(
          maxQuality: Field(
            value: quantity.toString(),
            isValid: false,
            errorMessage: 'Quality must be Greater than 0 and Less than 200',
          ),
        );
      ***REMOVED*** else ***REMOVED***
        form = _state.form.copyWith(
          maxQuality: Field(value: quantity, isValid: true, errorMessage: ''),
        );
      ***REMOVED***
    ***REMOVED***
    state = state.copyWith(form: form);
  ***REMOVED***

  void setImage(File file) ***REMOVED***
    final _state = state;
    var form = state.form;
    form =
        state.form.copyWith(fileImage: Field(value: file.path, isValid: true));
    state = state.copyWith(form: form);
  ***REMOVED***

  void publish(bool val) ***REMOVED***
    final _state = state;
    var form = state.form;
    form = state.form.copyWith(publish: val);
    state = state.copyWith(form: form);
  ***REMOVED***
***REMOVED***

final createProductFormNotifierProvider = StateNotifierProvider.autoDispose<
    CreateProductFormNotifier,
    AppFormState<CreateProductEntity>>((ref) => CreateProductFormNotifier());