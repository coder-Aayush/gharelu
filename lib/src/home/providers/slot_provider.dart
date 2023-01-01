import 'package:gharelu/src/core/extensions/date_time_extension.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/home/data_source/booking_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SlotNotifier extends StateNotifier<AppState<List<String>>> ***REMOVED***
  SlotNotifier(this._dataSource) : super(const AppState.initial());
  final BookingDataSource _dataSource;

  Future<void> getBookings(
      ***REMOVED***required DateTime date, required String serviceId***REMOVED***) async ***REMOVED***
    final times = generateTime();
    state = const AppState.loading();
    final response = await _dataSource.getBookingOnDate(
        date: date.serverFormattedDate(), serviceId: serviceId);
    state = response.fold(
      (error) => error.when(
        serverError: (message) => AppState.error(message: message),
        noInternet: () => const AppState.noInternet(),
      ),
      (response) ***REMOVED***
        final alreadyBookedTimes = response;
        for (var time in alreadyBookedTimes) ***REMOVED***
          if (times.contains(time.time)) ***REMOVED***
            times.remove(time.time);
          ***REMOVED***
        ***REMOVED***
        return AppState.success(data: times);
      ***REMOVED***,
    );
  ***REMOVED***

  List<String> generateTime() ***REMOVED***
    int startTime = 8;
    int endTime = 17;
    int hoursLeft = endTime - startTime + 1;

    final hours = List.generate(
            hoursLeft * 2,
            (i) =>
                '$***REMOVED***endTime - (i / 2).truncate()***REMOVED***:$***REMOVED***i % 2 == 1 ? '00' : '30'***REMOVED*** $***REMOVED***endTime - (i / 2).truncate() > 12 ? 'PM' : 'AM'***REMOVED***')
        .reversed
        .toList();
    return hours;
  ***REMOVED***
***REMOVED***

final slotNotifierProvider =
    StateNotifierProvider.autoDispose<SlotNotifier, AppState<List<String>>>(
  (ref) => SlotNotifier(
    ref.read(bookingDataSourceProvider),
  ),
);
