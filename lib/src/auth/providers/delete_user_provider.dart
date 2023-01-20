import 'package:gharelu/src/auth/data_source/auth_remote_source.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeleteUserProviderNotifier extends StateNotifier<AppState<bool>> ***REMOVED***
  DeleteUserProviderNotifier(this._remoteSource)
      : super(const AppState.initial());
  final AuthRemoteSource _remoteSource;

  Future<void> deleteUser(***REMOVED***String? message, required String password***REMOVED***) async ***REMOVED***
    state = const AppState.loading();
    final response = await _remoteSource.deleteUser(
      message: message,
      password: password,
    );
    state = response.fold(
        (error) => error.when(
              serverError: (message) => AppState.error(message: message),
              noInternet: () => const AppState.noInternet(),
            ),
        (response) => AppState.success(data: response));
  ***REMOVED***
***REMOVED***

final deleteUserProviderNotifierProvider = StateNotifierProvider.autoDispose<
        DeleteUserProviderNotifier, AppState<bool>>(
    (ref) => DeleteUserProviderNotifier(ref.read(authRemoteSourceProvider)));
