import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/home/data_source/service_data_source.dart';
import 'package:gharelu/src/home/models/category_model.dart';

class CategoriesState extends StateNotifier<AppState<List<CategoryModel>>> {
  CategoriesState(this._remoteSource)
      : super(const AppState<List<CategoryModel>>.initial());
  final ServiceRemoteSource _remoteSource;

  Future getServices() async {
    state = const AppState.loading();
    final response = await _remoteSource.getCategories();
    state = response.fold(
      (error) => error.when(
        serverError: (message) =>
            AppState<List<CategoryModel>>.error(message: message),
        noInternet: () => const AppState<List<CategoryModel>>.noInternet(),
      ),
      (response) => AppState.success(data: response),
    );
    log(state.toString());
  }
}

final categoriesStateProvider =
    StateNotifierProvider<CategoriesState, AppState<List<CategoryModel>>>(
  (ref) => CategoriesState(
    ref.read(serviceRemoteSourceProvider),
  )..getServices(),
);
