import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gharelu/src/auth/models/custom_user_model.dart';
import 'package:gharelu/src/core/constant/app_constant.dart';

part 'message_model.g.dart';
part 'message_model.freezed.dart';

@freezed
class MessageModel with _$MessageModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory MessageModel({
    required String id,
    required String userId,
    required String merchantId,
    String? message,
    String? imageUrl,
    required MessageType type,
    required String roomId,
    CustomUserModel? user,
    CustomUserModel? merchant,
    required String senderId,
    int? createdAt,
    required int updatedAt,
  }) = _MessageModel;
  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);
}
