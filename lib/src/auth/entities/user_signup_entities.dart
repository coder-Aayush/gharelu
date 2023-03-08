import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gharelu/src/core/validations/field.dart';
import 'package:velocity_x/velocity_x.dart';
part 'user_signup_entities.freezed.dart';

@freezed
class UserSignupFromEntity with _$UserSignupFromEntity {
  const UserSignupFromEntity._();
  const factory UserSignupFromEntity({
    required Field name,
    required Field email,
    required Field password,
    required Field confirmPassword,
    required Field location,
  }) = _UserSignupFromEntity;

  factory UserSignupFromEntity.empty() => const UserSignupFromEntity(
        name: Field(value: ''),
        confirmPassword: Field(value: ''),
        email: Field(value: ''),
        password: Field(value: ''),
        location: Field(value: ''),
        
      );

  bool get isEmailVerified => email.value.validateEmail();

  bool get isValid =>
      name.isValid &&
      email.isValid &&
      password.isValid &&
      confirmPassword.isValid && location.isValid;
}
