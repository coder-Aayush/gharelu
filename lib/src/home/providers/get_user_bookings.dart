import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gharelu/src/core/enum/order_type.dart';
import 'package:gharelu/src/home/data_source/booking_data_source.dart';
import 'package:gharelu/src/home/models/booking_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

part 'get_user_bookings.freezed.dart';
part 'state/get_user_bookings_state.dart';

class GetUserBookingsNotifier extends StateNotifier<GetUserBookingsState> ***REMOVED***
  GetUserBookingsNotifier(this._dataSource) : super(const GetUserBookingsState.initial());
  final BookingDataSource _dataSource;

  Future<void> getBookings() async ***REMOVED***
    state = const GetUserBookingsState.loading();
    final response = await _dataSource.getUserBookings();
    state = response.fold(
      (error) => error.when(
        serverError: (message) => GetUserBookingsState.error(message: message),
        noInternet: () => const GetUserBookingsState.noInternet(),
      ),
      (response) ***REMOVED***
        final now = DateTime.now();
        List<BookingModel> previous = [];
        List<BookingModel> upcoming = [];

        for (var item in response) ***REMOVED***
          if (DateTime.fromMillisecondsSinceEpoch(DateTime.parse(item.date).millisecondsSinceEpoch).isBefore(now) || item.orderType == OrderType.Completed) ***REMOVED***
            previous.add(item);
          ***REMOVED*** else ***REMOVED***
            upcoming.add(item);
          ***REMOVED***
        ***REMOVED***

        return GetUserBookingsState.success(
          previous: previous,
          upcoming: upcoming,
        );
      ***REMOVED***,
    );
  ***REMOVED***

  Future<void> updateBookings(***REMOVED***required String bookingId, required OrderType orderType***REMOVED***) async ***REMOVED***
    state = const GetUserBookingsState.loading();
    final response = await _dataSource.updateBookings(bookingId: bookingId, orderType: orderType);
    getBookings();
    state = response.fold(
      (error) => error.when(
        serverError: (message) => GetUserBookingsState.error(message: message),
        noInternet: () => const GetUserBookingsState.noInternet(),
      ),
      (response) ***REMOVED***
        final _state = state as _Success;
        return GetUserBookingsState.success(
          previous: _state.previous,
          upcoming: _state.upcoming,
        );
      ***REMOVED***,
    );
  ***REMOVED***
***REMOVED***

final getUserBookingsNotifierProvider = StateNotifierProvider<GetUserBookingsNotifier, GetUserBookingsState>(
  (ref) ***REMOVED***
    return GetUserBookingsNotifier(ref.read(bookingDataSourceProvider))..getBookings();
  ***REMOVED***,
);
