import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/home/data_source/service_data_source.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeleteProductNotifier extends StateNotifier<AppState<bool>> {
  DeleteProductNotifier(this._remoteSource) : super(const AppState.initial());
  final ServiceRemoteSource _remoteSource;
  Future deleteProduct(String id) async {
    state = const AppState.loading();
    final response = await _remoteSource.deleteProduct(id);
    state = response.fold(
      (error) => error.when(
        serverError: (message) => AppState.error(message: message),
        noInternet: () => const AppState.noInternet(),
      ),
      (response) => AppState.success(data: response),
    );
  }
}

final deleteProductNotifierProvider =
    StateNotifierProvider<DeleteProductNotifier, AppState<bool>>((ref) {
  return DeleteProductNotifier(ref.read(serviceRemoteSourceProvider));
});
