import 'dart:developer';

import 'package:gharelu/src/auth/data_source/auth_remote_source.dart';
import 'package:gharelu/src/auth/models/custom_user_model.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GetUserInfoNotifier extends StateNotifier<AppState<CustomUserModel>> {
  GetUserInfoNotifier(this._remoteSource) : super(const AppState.initial());
  final AuthRemoteSource _remoteSource;

  Future getUserInfo({required String id, bool isMerchant = false}) async {
    state = const AppState.loading();
    final response =
        await _remoteSource.getUserInfo(id: id, isMerchant: isMerchant);
    state = response.fold(
        (error) => error.when(
              serverError: (message) => AppState.error(message: message),
              noInternet: () => const AppState.noInternet(),
            ),
        (response) => AppState.success(data: response));
    log(state.toString());
  }
}

final getUserInfoNotifiderProvider =
    StateNotifierProvider<GetUserInfoNotifier, AppState<CustomUserModel>>(
  (ref) => GetUserInfoNotifier(
    ref.read(authRemoteSourceProvider),
  ),
);
