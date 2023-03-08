import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gharelu/src/core/validations/field.dart';
import 'package:velocity_x/velocity_x.dart';

part 'merchant_signup_entities.freezed.dart';

@freezed
class MerchantSignupFromEntity with _$MerchantSignupFromEntity {
  const MerchantSignupFromEntity._();
  const factory MerchantSignupFromEntity({
    required Field name,
    required Field email,
    required Field password,
    required Field phoneNumber,
    required Field location,
    required List<Field> documents,
  }) = _MerchantSignupFromEntity;

  factory MerchantSignupFromEntity.empty() => const MerchantSignupFromEntity(
        name: Field(value: ''),
        phoneNumber: Field(value: ''),
        email: Field(value: ''),
        password: Field(value: ''),
        location: Field(value: ''),
        documents: [],
      );

  bool get isEmailVerified => (email.value as String).validateEmail();

  bool get isValid =>
      name.isValid &&
      email.isValid &&
      password.isValid &&
      phoneNumber.isValid &&
      location.isValid &&
      documents.isNotEmpty;
}
