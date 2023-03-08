
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

@freezed
class BannerModel with _$BannerModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory BannerModel({
    required String id,
    required String title,
    required String description,
    required String path,
    required String imageUrl,
    @Default(false) bool redirect,
    @Default(true) isVisiable,
  })= _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}