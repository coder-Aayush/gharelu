import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gharelu/src/auth/data_source/auth_remote_source.dart';
import 'package:gharelu/src/core/state/app_state.dart';

class LoginState extends StateNotifier<AppState> {
  LoginState(this._remoteSource) : super(const AppState.initial());

  final AuthRemoteSource _remoteSource;

  Future<void> loginAsUser(
      {required String email, required String password}) async {
    state = const AppState.loading();
    final response =
        await _remoteSource.loginAsUser(email: email, password: password);
    state = response.fold(
      (error) => error.when(
          serverError: (message) => AppState.error(message: message),
          noInternet: () => const AppState.noInternet()),
      (response) => AppState.success(data: response),
    );
  }

  Future<void> loginAsMerchant() async {}
}

final loginProvider = StateNotifierProvider.autoDispose<LoginState, AppState>(
  (ref) => LoginState(ref.read(authRemoteSourceProvider)),
);
