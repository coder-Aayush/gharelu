***REMOVED***

***REMOVED***
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/home/data_source/service_data_source.dart';
import 'package:gharelu/src/home/models/service_model.dart';

class ServiceState extends StateNotifier<AppState<List<ServiceModel>>> ***REMOVED***
  ServiceState(this._remoteSource)
      : super(const AppState<List<ServiceModel>>.initial());
  final ServiceRemoteSource _remoteSource;

  Future<void> getServices() async ***REMOVED***
    state = const AppState.loading();
    final response = await _remoteSource.getServices();
    state = response.fold(
      (error) => error.when(
        serverError: (message) =>
            AppState<List<ServiceModel>>.error(message: message),
        noInternet: () => const AppState<List<ServiceModel>>.noInternet(),
      ),
      (response) => AppState.success(data: response),
    );
    log(state.toString());
  ***REMOVED***
***REMOVED***

final serviceStateProvider =
    StateNotifierProvider<ServiceState, AppState<List<ServiceModel>>>(
  (ref) => ServiceState(
    ref.read(serviceRemoteSourceProvider),
  ),
);
