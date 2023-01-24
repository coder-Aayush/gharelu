
part of '../get_merchant_bookings_provider.dart';


@freezed
class GetMerchantBookingsState with _$GetMerchantBookingsState ***REMOVED***
  const factory GetMerchantBookingsState.initial() = _Initial;

  const factory GetMerchantBookingsState.loading() = _Loading;

  const factory GetMerchantBookingsState.noInternet() = _NoInternet;

  const factory GetMerchantBookingsState.success(***REMOVED***
    required List<BookingModel> previous,
    required List<BookingModel> upcoming,
  ***REMOVED***) = _Success;

  


  const factory GetMerchantBookingsState.error(***REMOVED***
    required String message,
  ***REMOVED***) = _Error;
***REMOVED***