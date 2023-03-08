import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/home/data_source/booking_data_source.dart';
import 'package:gharelu/src/home/models/booking_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateBookingNotifier
    extends StateNotifier<AppState<List<BookingModel>>> {
  CreateBookingNotifier(this._dataSource) : super(const AppState.initial());

  final BookingDataSource _dataSource;

  Future<void> createBookings({required List<BookingModel> booking***REMOVED***) async {
    state = const AppState.loading();
    final response = await _dataSource.makeBooking(booking: booking);
    state = response.fold(
        (error) => error.when(
              serverError: (message) => AppState.error(message: message),
              noInternet: () => const AppState.noInternet(),
            ),
        (response) => AppState.success(data: response));
  ***REMOVED***
***REMOVED***

final createBookingProvider =
    StateNotifierProvider<CreateBookingNotifier, AppState<List<BookingModel>>>(
  (ref) => CreateBookingNotifier(
    ref.read(bookingDataSourceProvider),
  ),
);
