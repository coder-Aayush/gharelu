
part of '../get_user_bookings.dart';


@freezed
class GetUserBookingsState with _$GetUserBookingsState {
  const factory GetUserBookingsState.initial() = _Initial;

  const factory GetUserBookingsState.loading() = _Loading;

  const factory GetUserBookingsState.success({
    required List<BookingModel> previous,
    required List<BookingModel> upcoming,
  }) = _Success;

  const factory GetUserBookingsState.noInternet() = _Internet;

  const factory GetUserBookingsState.error({
    required String message,
  }) = _Error;
}
