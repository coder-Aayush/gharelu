import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gharelu/src/core/enum/order_type.dart';
import 'package:gharelu/src/home/data_source/booking_data_source.dart';
import 'package:gharelu/src/home/models/booking_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

part 'get_user_bookings.freezed.dart';
part 'state/get_user_bookings_state.dart';

class GetUserBookingsNotifier extends StateNotifier<GetUserBookingsState> {
  GetUserBookingsNotifier(this._dataSource) : super(const GetUserBookingsState.initial());
  final BookingDataSource _dataSource;

  Future<void> getBookings() async {
    state = const GetUserBookingsState.loading();
    final response = await _dataSource.getUserBookings();
    state = response.fold(
      (error) => error.when(
        serverError: (message) => GetUserBookingsState.error(message: message),
        noInternet: () => const GetUserBookingsState.noInternet(),
      ),
      (response) {
        List<BookingModel> previous = [];
        List<BookingModel> upcoming = [];

        for (var item in response) {
          if (item.orderType == OrderType.Cancelled || item.orderType == OrderType.Completed) {
            previous.add(item);
          } else {
            upcoming.add(item);
          }
        }

        return GetUserBookingsState.success(
          previous: previous,
          upcoming: upcoming,
        );
      },
    );
  }

  Future<void> updateBookings({required String bookingId, required OrderType orderType}) async {
    state = const GetUserBookingsState.loading();
    final response = await _dataSource.updateBookings(bookingId: bookingId, orderType: orderType);
    getBookings();
    state = response.fold(
      (error) => error.when(
        serverError: (message) => GetUserBookingsState.error(message: message),
        noInternet: () => const GetUserBookingsState.noInternet(),
      ),
      (response) {
        final _state = state as _Success;
        return GetUserBookingsState.success(
          previous: _state.previous,
          upcoming: _state.upcoming,
        );
      },
    );
  }
}

final getUserBookingsNotifierProvider = StateNotifierProvider<GetUserBookingsNotifier, GetUserBookingsState>(
  (ref) {
    return GetUserBookingsNotifier(ref.read(bookingDataSourceProvider))..getBookings();
  },
);
