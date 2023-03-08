import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gharelu/src/auth/entities/user_signup_entities.dart';
import 'package:gharelu/src/auth/providers/forms/signup/user_signup_form_state.dart';
import 'package:gharelu/src/core/validations/field.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:latlong2/latlong.dart';

class UserSignupFormProvider extends StateNotifier<UserSignupFormState> {
  UserSignupFormProvider()
      : super(UserSignupFormState(UserSignupFromEntity.empty()));

  void setName(String name) {
    var _form = state.form.copyWith(name: Field(value: name));
    late Field nameField;
    if (name.isEmpty) {
      nameField = _form.name
          .copyWith(isValid: false, errorMessage: 'Name cannot be empty');
    } else {
      nameField = _form.name.copyWith(isValid: true, errorMessage: '');
    }
    _form = _form.copyWith(name: nameField);
    state = state.copyWith(form: _form);
  }

  void setEmail(String email) {
    final _form = state.form.copyWith(email: Field(value: email));
    late Field emailField;
    if (email.trim().validateEmail()) {
      emailField = _form.email.copyWith(isValid: true, errorMessage: '');
    } else {
      emailField = _form.email
          .copyWith(isValid: false, errorMessage: 'Email doesn\'t looks right');
    }
    state = state.copyWith(form: _form.copyWith(email: emailField));
  }

  void setPassword(String password) {
    var _form = state.form.copyWith(password: Field(value: password));
    late Field passwordField;
    passwordField = _form.password.copyWith(isValid: true, errorMessage: '');
    state = state.copyWith(form: _form.copyWith(password: passwordField));
  }

  void setConfirmPassword(String confirmPassword) {
    final _password = state.form.password.value;
    var _form = state.form;
    late Field confirmPasswordField;
    if (_password == confirmPassword) {
      confirmPasswordField =
          _form.confirmPassword.copyWith(isValid: true, errorMessage: '');
    } else {
      confirmPasswordField = _form.confirmPassword.copyWith(
        value: confirmPassword,
        isValid: false,
        errorMessage: 'Password and Confirm Password do not match',
      );
    }
    state = state.copyWith(
        form: _form.copyWith(confirmPassword: confirmPasswordField));
  }

  void setLocation(String location, String placeId, LatLng latLng) {
    var _form = state.form.copyWith(location: Field(value: location));
    late Field locationField;
    locationField = _form.location.copyWith(isValid: true, errorMessage: '');
    state = state.copyWith(form: _form.copyWith(location: locationField));
  }
}

final userSignupFormProvider = StateNotifierProvider.autoDispose<
    UserSignupFormProvider,
    UserSignupFormState>((ref) => UserSignupFormProvider());
