import 'dart:io';

import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/home/data_source/service_data_source.dart';
import 'package:gharelu/src/home/models/product_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateProductNotifier extends StateNotifier<AppState<ProductModel>> {
  CreateProductNotifier(this._remoteSource) : super(const AppState.initial());

  final ServiceRemoteSource _remoteSource;

  Future createProduct(ProductModel product,
      {File? image, bool update = false}) async {
    state = const AppState.loading();
    final response = await _remoteSource.createProduct(product,
        productImage: image, update: update);
    state = response.fold(
      (error) => error.when(
        serverError: (message) => AppState.error(message: message),
        noInternet: () => const AppState.noInternet(),
      ),
      (response) => AppState.success(data: response),
    );
  }
}

final createProductNotifierProvider = StateNotifierProvider.autoDispose<
    CreateProductNotifier, AppState<ProductModel>>((ref) {
  return CreateProductNotifier(ref.read(serviceRemoteSourceProvider));
});
