import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState<T> with _$AppState<T> ***REMOVED***
  const factory AppState.initial() = _Initial;

  const factory AppState.loading() = _Loading;

  const factory AppState.success(***REMOVED***
    required T data,
  ***REMOVED***) = _Success;

  const factory AppState.noInternet() = _Internet;
  
  const factory AppState.error(***REMOVED***
    required String message,
  ***REMOVED***) = _Error;
***REMOVED***



