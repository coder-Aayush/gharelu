import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gharelu/src/core/enum/auth_type.dart';

part 'custom_user_model.g.dart';
part 'custom_user_model.freezed.dart';

@freezed
class CustomUserModel with _$CustomUserModel ***REMOVED***
  const CustomUserModel._();
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory CustomUserModel(***REMOVED***
    required String uid,
    required String name,
    required String email,
    String? phoneNumber,
    required String location,
    int? createdAt,
    required int updatedAt,
    @Default(false) bool isMerchant,
    @Default([]) List<String>? documents,
    AuthType? authType,
  ***REMOVED***) = _CustomUserModel;

  factory CustomUserModel.fromJson(Map<String, dynamic> json) =>
      _$CustomUserModelFromJson(json);

  // DateTime? get createdAt => DateTime.fromMillisecondsSinceEpoch(created_at!);

  // DateTime get updatedAt => DateTime.fromMillisecondsSinceEpoch(updated_at);
***REMOVED***
