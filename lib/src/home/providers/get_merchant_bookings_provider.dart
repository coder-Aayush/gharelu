import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gharelu/src/core/enum/order_type.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/home/data_source/booking_data_source.dart';
import 'package:gharelu/src/home/models/booking_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'state/get_merchant_bookings_state.dart';
part 'get_merchant_bookings_provider.freezed.dart';

class GetMerchantBookingsNotifier
    extends StateNotifier<GetMerchantBookingsState> {
  GetMerchantBookingsNotifier(this._dataSource)
      : super(const GetMerchantBookingsState.initial());
  final BookingDataSource _dataSource;

  Future getMerchantBookings() async {
    state = const GetMerchantBookingsState.loading();
    final response = await _dataSource.getMerchantBookings();
    state = response.fold(
      (error) => error.when(
        serverError: (message) =>
            GetMerchantBookingsState.error(message: message),
        noInternet: () => const GetMerchantBookingsState.noInternet(),
      ),
      (response) {
        final previous = <BookingModel>[];
        final upcoming = <BookingModel>[];
        for (var booking in response) {
          if (booking.orderType == OrderType.Completed ||
              booking.orderType == OrderType.Cancelled) {
            previous.add(booking);
          } else {
            upcoming.add(booking);
          }
        }
        print(response);
        return GetMerchantBookingsState.success(
          previous: previous,
          upcoming: upcoming,
        );
      },
    );
  }

  Future updateBookings(
      {required String bookingId, required OrderType orderType}) async {
    state = const GetMerchantBookingsState.loading();
    final response = await _dataSource.updateBookings(
        bookingId: bookingId, orderType: orderType);
    await getMerchantBookings();
    state = response.fold(
      (error) => error.when(
        serverError: (message) =>
            GetMerchantBookingsState.error(message: message),
        noInternet: () => const GetMerchantBookingsState.noInternet(),
      ),
      (response) {
        final _state = state as _Success;
        return GetMerchantBookingsState.success(
          previous: _state.previous,
          upcoming: _state.upcoming,
        );
      },
    );
  }
}

final getMerchantBookingsStateProvider = StateNotifierProvider<
    GetMerchantBookingsNotifier, GetMerchantBookingsState>((ref) {
  return GetMerchantBookingsNotifier(
    ref.read(bookingDataSourceProvider),
  )..getMerchantBookings();
});
