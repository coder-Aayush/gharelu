import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gharelu/src/auth/entities/user_login_entity.dart';
import 'package:gharelu/src/auth/providers/forms/login/user_login_form_state.dart';
import 'package:gharelu/src/core/validations/field.dart';
import 'package:velocity_x/velocity_x.dart';

class UserLoginFormProvider extends StateNotifier<UserLoginFormState> {
  UserLoginFormProvider() : super(UserLoginFormState(UserLoginEntity.empty()));

  void setEmail(String email) {
    UserLoginEntity _form = state.form.copyWith(
        email: Field(value: email)); // copy from from the state and add email
    late Field emailField;
    if (email.trim().validateEmail()) {
      emailField = _form.email.copyWith(isValid: true, errorMessage: '');
    } else {
      emailField = _form.email
          .copyWith(isValid: false, errorMessage: 'ops, email is not valid');
    }
    state = state.copyWith(form: _form.copyWith(email: emailField));
  }

  void setPassword(String password) {
    var _form = state.form.copyWith(password: Field(value: password));
    late Field passwordField;
    // TODO: Check for password
    if (password.isNotEmpty) {
      passwordField = _form.password.copyWith(isValid: true, errorMessage: '');
    } else {
      passwordField = _form.password
          .copyWith(isValid: false, errorMessage: 'enter valid password');
    }
    state = state.copyWith(form: _form.copyWith(password: passwordField));
  }
}

final userLoginFormProvider = StateNotifierProvider.autoDispose<
    UserLoginFormProvider,
    UserLoginFormState>((ref) => UserLoginFormProvider());
