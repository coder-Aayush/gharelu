import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gharelu/src/auth/data_source/auth_remote_source.dart';
import 'package:gharelu/src/core/state/app_state.dart';

class MerchantLoginProvider extends StateNotifier<AppState<User?>> {
  MerchantLoginProvider(this._remoteSource)
      : super(const AppState<User?>.initial());

  final AuthRemoteSource _remoteSource;

  Future<void> loginAsMerchant({
    required String email,
    required String password,
  }) async {
    state = const AppState.loading();
    final response =
        await _remoteSource.merchantLogin(email: email, password: password);
    state = response.fold(
      (error) => error.when(
          serverError: (message) => AppState.error(message: message),
          noInternet: () => const AppState.noInternet()),
      (response) => AppState.success(data: response),
    );
  }
}

final merchantLoginProvider =
    StateNotifierProvider.autoDispose<MerchantLoginProvider, AppState<User?>>(
        (ref) => MerchantLoginProvider(ref.read(authRemoteSourceProvider)));
