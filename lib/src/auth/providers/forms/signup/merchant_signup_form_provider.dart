import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gharelu/src/auth/entities/merchant_signup_entities.dart';
import 'package:gharelu/src/auth/providers/forms/signup/merchant_signup_form_state.dart';
import 'package:gharelu/src/core/validations/field.dart';
import 'package:velocity_x/velocity_x.dart';

class MerchantSignupFormProvider
    extends StateNotifier<MerchantSignupFormState> {
  MerchantSignupFormProvider()
      : super(MerchantSignupFormState(MerchantSignupFromEntity.empty()));

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
    final _form = state.form.copyWith(password: Field(value: password));
    late Field passwordField;
    if (password.length > 4) {
      passwordField = _form.password.copyWith(isValid: true, errorMessage: '');
    } else {
      passwordField = _form.password
          .copyWith(isValid: false, errorMessage: 'Password is not strong');
    }
    state = state.copyWith(form: _form.copyWith(password: passwordField));
  }

  void setPhoneNumber(String phoneNumber) {
    final _form = state.form.copyWith(phoneNumber: Field(value: phoneNumber));
    late Field phoneNumberField;
    if (phoneNumber.length > 5) {
      phoneNumberField =
          _form.phoneNumber.copyWith(isValid: true, errorMessage: '');
    } else {
      phoneNumberField = _form.phoneNumber
          .copyWith(isValid: false, errorMessage: 'Enter valid phone number');
    }
    state = state.copyWith(form: _form.copyWith(phoneNumber: phoneNumberField));
  }

  void setLocation(String location) {
    final _form = state.form.copyWith(location: Field(value: location));
    late Field locationField;

    locationField = _form.location.copyWith(isValid: true, errorMessage: '');
    state = state.copyWith(form: _form.copyWith(location: locationField));
  }

  void setDocuments(List<String> documents) {
    final _form = state.form.copyWith(
        documents: documents.map((doc) => Field(value: doc)).toList());
    late List<Field> documentsField;

    documentsField = _form.documents
        .map((e) => e.copyWith(isValid: true, errorMessage: ''))
        .toList();
    state = state.copyWith(
        form: _form.copyWith(documents: documentsField.toList()));
  }

  void removeDocument(Field docField) {
    var data = new List<Field>.from(state.form.documents);
    data.remove(docField);
    state = state.copyWith(form: state.form.copyWith(documents: data));
  }
}

final merchantSignupFormProvider =
    StateNotifierProvider.autoDispose<
    MerchantSignupFormProvider,
    MerchantSignupFormState>(
        (ref) => MerchantSignupFormProvider());
