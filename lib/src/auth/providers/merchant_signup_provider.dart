import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gharelu/src/auth/data_source/auth_remote_source.dart';
import 'package:gharelu/src/core/state/app_state.dart';

class MerchantSignupState extends StateNotifier<AppState<User?>> {
  MerchantSignupState(this._reader) : super(const AppState.initial());
  final Ref _reader;

  Future signupAsMerchant({
    required String email,
    required String name,
    required String phoneNumber,
    required String password,
    required List<File> documents,
    required String location,
  }) async {
    state = const AppState.loading();
    final response =
        await _reader.read(authRemoteSourceProvider).merchantSignup(
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
  }
}

final merchantSignupProvider =
    StateNotifierProvider.autoDispose<MerchantSignupState, AppState<User?>>(
        (ref) => MerchantSignupState(ref));
