import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
***REMOVED***
import 'package:gharelu/src/auth/data_source/auth_remote_source.dart';
import 'package:gharelu/src/core/state/app_state.dart';

class MerchantSignupState extends StateNotifier<AppState<User?>> ***REMOVED***
  MerchantSignupState(this._reader) : super(const AppState.initial());
  final Reader _reader;

  Future<void> signupAsMerchant(***REMOVED***
    required String email,
    required String name,
    required String phoneNumber,
    required String password,
    required List<File> documents,
    required String location,
  ***REMOVED***) async ***REMOVED***
    state = const AppState.loading();
    final response = await _reader(authRemoteSourceProvider).merchantSignup(
      email: email,
      name: name,
      phoneNumber: phoneNumber,
      password: password,
      documents: documents,
      location: location,
    );
    state = response.fold(
      (error) => error.when(
          serverError: (message) => AppState.error(message: message),
          noInternet: () => const AppState.noInternet()),
      (response) => AppState.success(data: response),
    );
  ***REMOVED***
***REMOVED***

final merchantSignupProvider =
    StateNotifierProvider<MerchantSignupState, AppState<User?>>(
        (ref) => MerchantSignupState(ref.read));
