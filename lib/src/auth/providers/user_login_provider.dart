***REMOVED***
import 'package:gharelu/src/auth/data_source/auth_remote_source.dart';
import 'package:gharelu/src/core/state/app_state.dart';

class UserLoginState extends StateNotifier<AppState> ***REMOVED***
  UserLoginState(this._remoteSource) : super(const AppState.initial());

  final AuthRemoteSource _remoteSource;

  Future<void> loginAsUser(
      ***REMOVED***required String email, required String password***REMOVED***) async ***REMOVED***
    state = const AppState.loading();
    final response =
        await _remoteSource.loginAsUser(email: email, password: password);
    state = response.fold(
      (error) => error.when(
          serverError: (message) => AppState.error(message: message),
          noInternet: () => const AppState.noInternet()),
      (response) => AppState.success(data: response),
    );
  ***REMOVED***
***REMOVED***

final userLoginProvider =
    StateNotifierProvider.autoDispose<UserLoginState, AppState>(
  (ref) => UserLoginState(ref.read(authRemoteSourceProvider)),
);
