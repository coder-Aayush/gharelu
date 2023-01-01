***REMOVED***

***REMOVED***
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/home/data_source/service_data_source.dart';
import 'package:gharelu/src/home/models/category_model.dart';
import 'package:gharelu/src/home/models/service_model.dart';

class ServiceCategoryState extends StateNotifier<AppState<List<ServiceModel>>> ***REMOVED***
  ServiceCategoryState(this._remoteSource)
      : super(const AppState<List<ServiceModel>>.initial());
  final ServiceRemoteSource _remoteSource;

  Future<void> getServices(***REMOVED***required String categoryId***REMOVED***) async ***REMOVED***
    state = const AppState.loading();
    final response = await _remoteSource.getServices(id: categoryId);
    state = response.fold(
        (error) => error.when(
            serverError: (message) => AppState.error(message: message),
            noInternet: () => const AppState.noInternet()),
        (response) => AppState.success(data: response));
  ***REMOVED***
***REMOVED***

final serviceCategoryStateProvider = StateNotifierProvider.autoDispose<
    ServiceCategoryState, AppState<List<ServiceModel>>>((ref) ***REMOVED***
  return ServiceCategoryState(ref.read(serviceRemoteSourceProvider));
***REMOVED***);
