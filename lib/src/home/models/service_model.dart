

import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_model.freezed.dart';
part 'service_model.g.dart';

@freezed
class ServiceModel with _$ServiceModel ***REMOVED***
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ServiceModel(***REMOVED***
    required String id,
    required String name,
    required String image,
    required int discount,
    @Default(true) bool enable,
    required int createdAt,
    required int updatedAt,
    String? serviceId,
  ***REMOVED***) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
***REMOVED***