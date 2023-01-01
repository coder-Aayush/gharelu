import 'package:freezed_annotation/freezed_annotation.dart';
part 'service_model.g.dart';
part 'service_model.freezed.dart';

@freezed
class ServiceModel with _$ServiceModel ***REMOVED***
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ServiceModel(***REMOVED***
    required String id,
    required String name,
    required String image,
    required String merchantId,
    required String categoryId,
    @Default(false) bool isPromoted,
    int? createdAt,
    int? updatedAt,
    @Default(false) bool enable,
  ***REMOVED***) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
***REMOVED***
