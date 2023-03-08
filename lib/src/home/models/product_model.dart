import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gharelu/src/home/models/category_model.dart';
import 'package:gharelu/src/home/models/service_model.dart';

part 'product_model.g.dart';
part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ProductModel({
    required String id,
    required String categoryId,
    required int createdAt,
    required String description,
    required String image,
    required String name,
    required int price,
    required String serviceId,
    required String merchantId,
    required int updatedAt,
    @Default(0) int quantity,
    @Default(false) bool unPublish,
    CategoryModel? category,
    ServiceModel? service,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  factory ProductModel.empty() {
    final now = DateTime.now().millisecondsSinceEpoch;
    return ProductModel(
      id: '',
      categoryId: '',
      createdAt: now,
      description: '',
      image: '',
      name: '',
      price: 0,
      serviceId: '',
      merchantId: '',
      updatedAt: now,
    );
  }
}
