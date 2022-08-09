import 'package:firebase_auth/firebase_auth.dart';
***REMOVED***
import 'package:gharelu/src/auth/data_source/auth_remote_source.dart';
import 'package:gharelu/src/core/state/app_state.dart';

class MerchantLoginProvider extends StateNotifier<AppState<User?>> ***REMOVED***
  MerchantLoginProvider(this._remoteSource)
      : super(const AppState<User?>.initial());

  final AuthRemoteSource _remoteSource;

  Future<void> loginAsMerchant(***REMOVED***
    required String email,
    required String password,
  ***REMOVED***) async ***REMOVED***
    state = const AppState.loading();
    final response =
        await _remoteSource.merchantLogin(email: email, password: password);
    state = response.fold(
      (error) => error.when(
          serverError: (message) => AppState.error(message: message),
          noInternet: () => const AppState.noInternet()),
      (response) => AppState.success(data: response),
    );
  ***REMOVED***
***REMOVED***

final merchantLoginProvider =
    StateNotifierProvider.autoDispose<MerchantLoginProvider, AppState<User?>>(
        (ref) => MerchantLoginProvider(ref.read(authRemoteSourceProvider)));
