import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory CategoryModel({
    required String id,
    required String name,
    required String image,
    @Default(true) bool enable,
    required int createdAt,
    required int updatedAt,
  ***REMOVED***) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  factory CategoryModel.empty() {
    final now = DateTime.now().millisecondsSinceEpoch;
    return CategoryModel(
      id: '',
      name: '',
      image: '',
      createdAt: now,
      updatedAt: now,
    );
  ***REMOVED***
***REMOVED***
