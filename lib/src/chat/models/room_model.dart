import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gharelu/src/auth/models/custom_user_model.dart';
import 'package:gharelu/src/home/models/product_model.dart';

part 'room_model.g.dart';
part 'room_model.freezed.dart';

@freezed
class RoomModel with _$RoomModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory RoomModel({
    required String id,
    required String userId,
    required String merchantId,
    required String productId,
    CustomUserModel? user,
    CustomUserModel? merchant,
    int? createdAt,
    int? updatedAt,
    ProductModel? product,
  }) = _RoomModel;
  factory RoomModel.fromJson(Map<String, dynamic> json) => _$RoomModelFromJson(json);
}
