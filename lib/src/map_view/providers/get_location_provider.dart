import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/map_view/data_source/location_data_source.dart';

class GetLocationState extends StateNotifier<AppState<String>> {
  GetLocationState(this._dataSource) : super(const AppState<String>.initial());
  final LocationDataSource _dataSource;

  Future<void> getLocationFromLatLng(
      {required String lat, required String lng***REMOVED***) async {
    state = const AppState.loading();
    final response =
        await _dataSource.getLocationFromGeoCordinates(lat: lat, lng: lng);
    state = response.fold(
      (error) => error.when(
          serverError: (message) => AppState.error(message: message),
          noInternet: () => const AppState.noInternet()),
      (response) => AppState<String>.success(data: response),
    );
  ***REMOVED***
***REMOVED***

final getLocationStateProvider =
    StateNotifierProvider.autoDispose<GetLocationState, AppState>(
  (ref) => GetLocationState(
    ref.read(locationDataSourceProvider),
  ),
);
