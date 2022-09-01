import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';
part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel ***REMOVED***
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ProductModel(***REMOVED***
    required String categoryId,
    required int createdAt,
    required String description,
    required String image,
    required String name,
    required int price,
    required String serviceId,
    required int updatedAt,
  ***REMOVED***) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
***REMOVED***
