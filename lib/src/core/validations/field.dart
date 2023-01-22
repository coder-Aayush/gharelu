import 'package:freezed_annotation/freezed_annotation.dart';

part 'field.freezed.dart';

@freezed
class Field with _$Field ***REMOVED***
  const factory Field(***REMOVED***
    required String value,
    @Default('') String errorMessage,
    @Default('') String warningMessage,
    @Default(false) bool isValid,
    @Default(false) bool isTouched,
    @Default(false) bool obscureText,
  ***REMOVED***) = _Field;
***REMOVED***