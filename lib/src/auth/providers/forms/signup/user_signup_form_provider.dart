***REMOVED***
import 'package:gharelu/src/auth/entities/user_signup_entities.dart';
import 'package:gharelu/src/auth/providers/forms/signup/user_signup_form_state.dart';
import 'package:gharelu/src/core/validations/field.dart';
import 'package:velocity_x/velocity_x.dart';

class UserSignupFormProvider extends StateNotifier<UserSignupFormState> ***REMOVED***
  UserSignupFormProvider()
      : super(UserSignupFormState(UserSignupFromEntity.empty()));

  void setName(String name) ***REMOVED***
    var _form = state.form.copyWith(name: Field(value: name));
    late Field nameField;
    if (name.isEmpty) ***REMOVED***
      nameField = _form.name
          .copyWith(isValid: false, errorMessage: 'Name cannot be empty');
    ***REMOVED*** else ***REMOVED***
      nameField = _form.name.copyWith(isValid: true, errorMessage: '');
    ***REMOVED***
    _form = _form.copyWith(name: nameField);
    state = state.copyWith(form: _form);
  ***REMOVED***

  void setEmail(String email) ***REMOVED***
    final _form = state.form.copyWith(email: Field(value: email));
    late Field emailField;
    if (email.trim().validateEmail()) ***REMOVED***
      emailField = _form.email.copyWith(isValid: true, errorMessage: '');
    ***REMOVED*** else ***REMOVED***
      emailField = _form.email
          .copyWith(isValid: false, errorMessage: 'Email doesn\'t looks right');
    ***REMOVED***
    state = state.copyWith(form: _form.copyWith(email: emailField));
  ***REMOVED***

  void setPassword(String password) ***REMOVED***
    var _form = state.form.copyWith(password: Field(value: password));
    late Field passwordField;
    passwordField = _form.password.copyWith(isValid: true, errorMessage: '');
    state = state.copyWith(form: _form.copyWith(password: passwordField));
  ***REMOVED***

  void setConfirmPassword(String confirmPassword) ***REMOVED***
    final _password = state.form.password.value;
    var _form = state.form;
    late Field confirmPasswordField;
    if (_password == confirmPassword) ***REMOVED***
      confirmPasswordField =
          _form.confirmPassword.copyWith(isValid: true, errorMessage: '');
    ***REMOVED*** else ***REMOVED***
      confirmPasswordField = _form.confirmPassword.copyWith(
        value: confirmPassword,
        isValid: false,
        errorMessage: 'Password and Confirm Password do not match',
      );
    ***REMOVED***
    state = state.copyWith(
        form: _form.copyWith(confirmPassword: confirmPasswordField));
  ***REMOVED***

  void setLocation(String location) ***REMOVED***
    var _form = state.form.copyWith(location: Field(value: location));
    late Field locationField;
    locationField = _form.location.copyWith(isValid: true, errorMessage: '');
    state = state.copyWith(form: _form.copyWith(location: locationField));
  ***REMOVED***
***REMOVED***

final userSignupFormProvider = StateNotifierProvider.autoDispose<
    UserSignupFormProvider,
    UserSignupFormState>((ref) => UserSignupFormProvider());
