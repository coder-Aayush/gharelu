
part of '../get_user_bookings.dart';


@freezed
class GetUserBookingsState with _$GetUserBookingsState ***REMOVED***
  const factory GetUserBookingsState.initial() = _Initial;

  const factory GetUserBookingsState.loading() = _Loading;

  const factory GetUserBookingsState.success(***REMOVED***
    required List<BookingModel> previous,
    required List<BookingModel> upcoming,
  ***REMOVED***) = _Success;

  const factory GetUserBookingsState.noInternet() = _Internet;

  const factory GetUserBookingsState.error(***REMOVED***
    required String message,
  ***REMOVED***) = _Error;
***REMOVED***
