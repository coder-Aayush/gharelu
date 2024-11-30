import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/home/data_source/service_data_source.dart';
import 'package:gharelu/src/home/models/service_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateServiceNotifier extends StateNotifier<AppState<ServiceModel>> {
  CreateServiceNotifier(this._remoteSource) : super(const AppState.initial());

  final ServiceRemoteSource _remoteSource;

  Future createService(ServiceModel service) async {
    state = const AppState.loading();
    final response = await _remoteSource.createServices(service);
    state = response.fold(
      (error) => error.when(
        serverError: (message) => AppState.error(message: message),
        noInternet: () => const AppState.noInternet(),
      ),
      (response) => AppState.success(data: response),
    );
  }
}

final createServiceNotifierProvider = StateNotifierProvider.autoDispose<
    CreateServiceNotifier, AppState<ServiceModel>>(
  (ref) => CreateServiceNotifier(
    ref.read(serviceRemoteSourceProvider),
  ),
);
