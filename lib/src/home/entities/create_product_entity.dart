import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gharelu/src/core/validations/field.dart';
import 'package:gharelu/src/home/models/category_model.dart';
import 'package:gharelu/src/home/models/service_model.dart';

part 'create_product_entity.freezed.dart';

@freezed
class CreateProductEntity with _$CreateProductEntity {
  const CreateProductEntity._();
  const factory CreateProductEntity({
    required Field productName,
    required Field description,
    required Field price,
    required Field maxQuality,
    @Default(false) bool publish,
    Field? fileImage,
    required String imageUrl,
    String? id,
    required String serviceId,
    required String merchantId,
    required String categoryId,
    required CategoryModel category,
    required ServiceModel service,
  }) = _CreateProductEntity;

  factory CreateProductEntity.empty() => CreateProductEntity(
        categoryId: '',
        description: const Field(value: ''),
        imageUrl: '',
        maxQuality: const Field(value: ''),
        category: CategoryModel.empty(),
        merchantId: '',
        price: const Field(value: ''),
        service: ServiceModel.empty(),
        productName: const Field(value: ''),
        serviceId: '',
      );

  bool get isValid {
    return productName.isValid &&
        description.isValid &&
        price.isValid &&
        maxQuality.isValid &&
        category.id.isNotEmpty &&
        service.id.isNotEmpty &&
        (imageUrl.isEmpty ? (fileImage?.isValid ?? false) : true);
  }
}
