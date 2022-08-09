***REMOVED***

***REMOVED***
***REMOVED***
import 'package:gharelu/src/core/constant/app_constant.dart';
***REMOVED***
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/home/models/banner_model.dart';

abstract class _BannerRemoteSource ***REMOVED***
  Future<Either<AppError, List<BannerModel>>> getBanners();
***REMOVED***

class BannerRemoteSource implements _BannerRemoteSource ***REMOVED***
  BannerRemoteSource(this._reader);

  final Reader _reader;
***REMOVED***
  Future<Either<AppError, List<BannerModel>>> getBanners() async ***REMOVED***
***REMOVED***
      _reader(firebaseAuthProvider).authStateChanges().listen((event) ***REMOVED***
        log(event.toString());
    ***REMOVED***
      final response = await _reader(firestoreProvider)
          .collection(AppConstant.banners)
          .get();
      if (response.docs.isNotEmpty) ***REMOVED***
        return right(response.docs
            .map((banner) => BannerModel.fromJson(banner.data()))
            .toList());
      ***REMOVED*** else ***REMOVED***
        return right([]);
      ***REMOVED***
    ***REMOVED*** catch (e) ***REMOVED***
      log(e.toString());
      return left(
          const AppError.serverError(message: 'Failed to Fetch Banners'));
    ***REMOVED***
  ***REMOVED***
***REMOVED***

final bannerRemoteSourceProvider =
    Provider<BannerRemoteSource>((ref) => BannerRemoteSource(ref.read));
