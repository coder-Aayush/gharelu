***REMOVED***
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/home/data_source/service_data_source.dart';
import 'package:gharelu/src/home/models/product_model.dart';

class ProductState extends StateNotifier<AppState<List<ProductModel>>> ***REMOVED***
  ProductState(this._remoteSource)
      : super(const AppState<List<ProductModel>>.initial());

  final ServiceRemoteSource _remoteSource;

  Future<void> getProducts(***REMOVED***
    required String categoryId,
    required String serviceId,
  ***REMOVED***) async ***REMOVED***
    state = const AppState.loading();
    final response = await _remoteSource.getProducts(categoryId: categoryId);
    state = response.fold(
        (error) => error.when(
            serverError: (message) => AppState.error(message: message),
            noInternet: () => const AppState.noInternet()),
        (response) => AppState.success(data: response));
  ***REMOVED***
***REMOVED***

final productStateProvider =
    StateNotifierProvider<ProductState, AppState<List<ProductModel>>>(
        (ref) => ProductState(ref.read(serviceRemoteSourceProvider)));
