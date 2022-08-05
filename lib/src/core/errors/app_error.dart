import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';

@freezed
class AppError with _$AppError {
  const factory AppError.serverError({required String message}) = _ServerError;

  const factory AppError.noInternet() = _NoInternet;
}
