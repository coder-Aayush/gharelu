import 'package:freezed_annotation/freezed_annotation.dart';
part 'service_model.g.dart';
part 'service_model.freezed.dart';

@freezed
class ServiceModel with _$ServiceModel {
  const ServiceModel._();
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ServiceModel({
    required String id,
    required String name,
    required String image,
    required String merchantId,
    required String categoryId,
    @Default(false) bool isPromoted,
    int? createdAt,
    int? updatedAt,
    @Default(false) bool enable,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  factory ServiceModel.empty() => const ServiceModel(
        id: '',
        name: '',
        image: '',
        merchantId: '',
        categoryId: '',
      );
}
