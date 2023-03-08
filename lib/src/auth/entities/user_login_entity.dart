import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gharelu/src/core/validations/field.dart';

part 'user_login_entity.freezed.dart';

@freezed
class UserLoginEntity with _$UserLoginEntity {
  const UserLoginEntity._();
  const factory UserLoginEntity({
    required Field email,
    required Field password,
  }) = _UserLoginEntity;

  factory UserLoginEntity.empty() => const UserLoginEntity(
        email: Field(value: ''),
        password: Field(value: ''),
      );

  bool get isValid => email.isValid && password.isValid;
}
