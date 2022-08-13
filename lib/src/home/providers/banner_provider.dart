***REMOVED***

***REMOVED***
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:gharelu/src/home/data_source/banner_data_source.dart';
import 'package:gharelu/src/home/models/banner_model.dart';

class BannerState extends StateNotifier<AppState<List<BannerModel>>> ***REMOVED***
  BannerState(this._remoteSource)
      : super(const AppState<List<BannerModel>>.initial());
  final BannerRemoteSource _remoteSource;

  Future<void> getBanners() async ***REMOVED***
    state = const AppState.loading();
    final response = await _remoteSource.getBanners();
    state = response.fold(
      (error) => error.when(
          serverError: (message) => AppState.error(message: message),
          noInternet: () => const AppState.noInternet()),
      (response) => AppState<List<BannerModel>>.success(data: response),
    );
  ***REMOVED***
***REMOVED***

final bannerStateProvider =
    StateNotifierProvider.autoDispose<BannerState, AppState<List<BannerModel>>>(
        (ref) => BannerState(ref.read(bannerRemoteSourceProvider)));