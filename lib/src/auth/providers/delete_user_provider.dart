import 'package:gharelu/src/auth/data_source/auth_remote_source.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeleteUserProviderNotifier extends StateNotifier<AppState<bool>> {
  DeleteUserProviderNotifier(this._remoteSource)
      : super(const AppState.initial());
  final AuthRemoteSource _remoteSource;

  Future deleteUser({
    String? message,
    required String password,
    bool isMerchant = false,
  }) async {
    state = const AppState.loading();
    final response = await _remoteSource.deleteUser(
        message: message, password: password, isMerchant: isMerchant);
    state = response.fold(
        (error) => error.when(
              serverError: (message) => AppState.error(message: message),
              noInternet: () => const AppState.noInternet(),
            ),
        (response) => AppState.success(data: response));
  }
}

final deleteUserProviderNotifierProvider = StateNotifierProvider.autoDispose<
        DeleteUserProviderNotifier, AppState<bool>>(
    (ref) => DeleteUserProviderNotifier(ref.read(authRemoteSourceProvider)));
