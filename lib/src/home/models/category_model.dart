import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel ***REMOVED***
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory CategoryModel(***REMOVED***
    required String id,
    required String name,
    required String image,
    @Default(true) bool enable,
    required int createdAt,
    required int updatedAt,
  ***REMOVED***) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
***REMOVED***
