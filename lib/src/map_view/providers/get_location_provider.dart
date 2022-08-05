// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/map_view/data_source/location_data_source.dart';

class GetLocationState extends StateNotifier<AppState> {
  GetLocationState(this._dataSource) : super(const AppState.initial());
  final LocationDataSource _dataSource;
  Future<void> getLocationFromLatLng(
      {required String lat, required String lng}) async {
    state = const AppState.loading();
    final response = await _dataSource.getLocationString(lat: lat, lng: lng);
    response.fold(
      (l) => l.when(
          serverError: (message) => AppState.error(message: message),
          noInternet: () => const AppState.noInternet()),
      (response) => AppState.success(data: response),
    );
  }
}

final getLocationStateProvider =
    StateNotifierProvider<GetLocationState, AppState>(
  (ref) => GetLocationState(
    ref.read(locationDataSourceProvider),
  ),
);
