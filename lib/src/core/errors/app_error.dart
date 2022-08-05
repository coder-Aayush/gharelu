import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';

@freezed
class AppError with _$AppError ***REMOVED***
  const factory AppError.serverError(***REMOVED***required String message***REMOVED***) = _ServerError;

  const factory AppError.noInternet() = _NoInternet;
***REMOVED***
