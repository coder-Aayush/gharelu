***REMOVED***
import 'package:gharelu/src/auth/entities/merchant_signup_entities.dart';
import 'package:gharelu/src/auth/providers/forms/signup/merchant_signup_form_state.dart';
import 'package:gharelu/src/core/validations/field.dart';
import 'package:velocity_x/velocity_x.dart';

class MerchantSignupFormProvider
    extends StateNotifier<MerchantSignupFormState> ***REMOVED***
  MerchantSignupFormProvider()
      : super(MerchantSignupFormState(MerchantSignupFromEntity.empty()));

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
    final _form = state.form.copyWith(password: Field(value: password));
    late Field passwordField;
    if (password.length > 4) ***REMOVED***
      passwordField = _form.password.copyWith(isValid: true, errorMessage: '');
    ***REMOVED*** else ***REMOVED***
      passwordField = _form.password
          .copyWith(isValid: false, errorMessage: 'Password is not strong');
    ***REMOVED***
    state = state.copyWith(form: _form.copyWith(password: passwordField));
  ***REMOVED***

  void setPhoneNumber(String phoneNumber) ***REMOVED***
    final _form = state.form.copyWith(phoneNumber: Field(value: phoneNumber));
    late Field phoneNumberField;
    if (phoneNumber.length > 5) ***REMOVED***
      phoneNumberField =
          _form.phoneNumber.copyWith(isValid: true, errorMessage: '');
    ***REMOVED*** else ***REMOVED***
      phoneNumberField = _form.phoneNumber
          .copyWith(isValid: false, errorMessage: 'Enter valid phone number');
    ***REMOVED***
    state = state.copyWith(form: _form.copyWith(phoneNumber: phoneNumberField));
  ***REMOVED***

  void setLocation(String location) ***REMOVED***
    final _form = state.form.copyWith(location: Field(value: location));
    late Field locationField;

    locationField = _form.location.copyWith(isValid: true, errorMessage: '');
    state = state.copyWith(form: _form.copyWith(location: locationField));
  ***REMOVED***

  void setDocuments(List<String> documents) ***REMOVED***
    final _form = state.form.copyWith(
        documents: documents.map((doc) => Field(value: doc)).toList());
    late List<Field> documentsField;

    documentsField = _form.documents
        .map((e) => e.copyWith(isValid: true, errorMessage: ''))
        .toList();
    state = state.copyWith(
        form: _form.copyWith(documents: documentsField.toList()));
  ***REMOVED***

  void removeDocument(Field docField) ***REMOVED***
    var data = new List<Field>.from(state.form.documents);
    data.remove(docField);
    state = state.copyWith(form: state.form.copyWith(documents: data));
  ***REMOVED***
***REMOVED***

final merchantSignupFormProvider =
    StateNotifierProvider<MerchantSignupFormProvider, MerchantSignupFormState>(
        (ref) => MerchantSignupFormProvider());
