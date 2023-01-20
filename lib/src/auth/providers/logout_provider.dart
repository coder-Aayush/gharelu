import 'package:gharelu/src/auth/data_source/auth_remote_source.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogoutStateNotifier extends StateNotifier<AppState<bool>> ***REMOVED***
  LogoutStateNotifier(this._remoteSource) : super(const AppState.initial());
  final AuthRemoteSource _remoteSource;

  Future<void> logout() async ***REMOVED***
    state = const AppState.loading();
    final response = await _remoteSource.logout();
    state = response.fold(
      (error) => error.when(
        serverError: (message) => AppState.error(message: message),
        noInternet: () => const AppState.noInternet(),
      ),
      (response) => AppState.success(data: response),
    );
  ***REMOVED***
***REMOVED***

final logoutStateNotifierProvider =
    StateNotifierProvider.autoDispose<LogoutStateNotifier, AppState<bool>>(
  (ref) => LogoutStateNotifier(
    ref.read(authRemoteSourceProvider),
  ),
);
