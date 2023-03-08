import 'dart:io';

import 'package:gharelu/src/core/state/app_form_state.dart';
import 'package:gharelu/src/core/validations/field.dart';
import 'package:gharelu/src/home/entities/create_product_entity.dart';
import 'package:gharelu/src/home/models/category_model.dart';
import 'package:gharelu/src/home/models/product_model.dart';
import 'package:gharelu/src/home/models/service_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateProductFormNotifier
    extends StateNotifier<AppFormState<CreateProductEntity>> {
  CreateProductFormNotifier()
      : super(AppFormState(CreateProductEntity.empty()));

  void setProduct(ProductModel product) {
    setName(product.name);
    setProductDescription(product.description);
    setPrice(product.price.toString());
    setQuantity(product.quantity.toString());
    if (product.category != null) {
      setService(product.category!);
    }
    if (product.service != null) {
      setCategory(product.service!);
    }
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
  }

  void setService(CategoryModel category) {
    final _state = state;
    var form = state.form;
    state = _state.copyWith(
        form: form.copyWith(category: category, categoryId: category.id));
  }

  void setCategory(ServiceModel service) {
    final _state = state;
    var form = state.form;
    state = _state.copyWith(
      form: form.copyWith(
        service: service,
        serviceId: service.id,
      ),
    );
  }

  void setName(String name) {
    final _state = state;
    var form = state.form;

    if (name.trim().isEmpty) {
      form = _state.form.copyWith(
        productName: Field(
          value: name,
          isValid: false,
          errorMessage: 'Product Name must be a valid name',
        ),
      );
    } else {
      if (name.length <= 10 || name.length >= 60) {
        print(name.length);
        form = _state.form.copyWith(
          productName: Field(
            value: name,
            isValid: true,
            warningMessage:
                'Recommended: Catchy name can be between 10 words to 60 words.',
          ),
        );
      } else {
        form = _state.form
            .copyWith(productName: Field(value: name, isValid: true));
      }
    }
    state = state.copyWith(form: form);
  }

  void setProductDescription(String description) {
    final _state = state;
    var form = state.form;
    if (description.trim().isEmpty) {
      form = _state.form.copyWith(
        description: Field(
          value: description,
          isValid: false,
          errorMessage: 'Discription must be a valid name',
        ),
      );
    } else {
      form = _state.form.copyWith(
        description: Field(value: description, isValid: true, errorMessage: ''),
      );
    }
    state = state.copyWith(form: form);
  }

  void setPrice(String price) {
    final _state = state;
    var form = state.form;
    if (price.isEmpty) {
      form = _state.form.copyWith(
        price: Field(
          value: price,
          isValid: false,
          errorMessage: 'Price cannot be less than 50',
        ),
      );
    } else {
      final _price = int.parse(price);
      if (_price < 49 || _price > 9998) {
        form = _state.form.copyWith(
          price: Field(
            value: _price.toString(),
            isValid: false,
            errorMessage: 'Product Price should be between 50 to 9999',
          ),
        );
      } else {
        form = _state.form.copyWith(
          price: Field(value: price, isValid: true, errorMessage: ''),
        );
      }
    }
    state = state.copyWith(form: form);
  }

  void setQuantity(String quantity) {
    final _state = state;
    var form = state.form;
    if (quantity.isEmpty) {
      form = _state.form.copyWith(
        maxQuality: Field(
          value: quantity,
          isValid: false,
          errorMessage: 'Quality must be Greater than 1',
        ),
      );
    } else {
      final _quantity = int.parse(quantity);
      if (_quantity < 1 || _quantity > 200) {
        form = _state.form.copyWith(
          maxQuality: Field(
            value: quantity.toString(),
            isValid: false,
            errorMessage: 'Quality must be Greater than 0 and Less than 200',
          ),
        );
      } else {
        form = _state.form.copyWith(
          maxQuality: Field(value: quantity, isValid: true, errorMessage: ''),
        );
      }
    }
    state = state.copyWith(form: form);
  }

  void setImage(File file) {
    final _state = state;
    var form = state.form;
    form =
        state.form.copyWith(fileImage: Field(value: file.path, isValid: true));
    state = state.copyWith(form: form);
  }

  void publish(bool val) {
    final _state = state;
    var form = state.form;
    form = state.form.copyWith(publish: val);
    state = state.copyWith(form: form);
  }
}

final createProductFormNotifierProvider = StateNotifierProvider.autoDispose<
    CreateProductFormNotifier,
    AppFormState<CreateProductEntity>>((ref) => CreateProductFormNotifier());
