import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gharelu/src/auth/entities/user_signup_entities.dart';

part 'user_signup_form_state.freezed.dart';

@freezed
class UserSignupFormState with _$UserSignupFormState {
  const factory UserSignupFormState(UserSignupFromEntity form) = _UserSignupFromState;
***REMOVED***