***REMOVED***

***REMOVED***
***REMOVED***
import 'package:gharelu/src/core/constant/app_constant.dart';
***REMOVED***
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/home/models/service_model.dart';

abstract class _ServiceRemoteSource ***REMOVED***
  Future<Either<AppError, List<ServiceModel>>> getServices();
  Future<Either<AppError, List<ServiceModel>>> getServiceCategories(
      ***REMOVED***required String id***REMOVED***);
***REMOVED***

class ServiceRemoteSource implements _ServiceRemoteSource ***REMOVED***
  ServiceRemoteSource(this._reader);

  final Reader _reader;
***REMOVED***
  Future<Either<AppError, List<ServiceModel>>> getServices() async ***REMOVED***
***REMOVED***
      final response = await _reader(firestoreProvider)
          .collection(AppConstant.services)
          .get();
      if (response.docs.isNotEmpty) ***REMOVED***
        final _service = List<ServiceModel>.from(response.docs
            .map((service) => ServiceModel.fromJson(service.data())));
        return right(_service);
      ***REMOVED*** else ***REMOVED***
        return right([]);
      ***REMOVED***
    ***REMOVED*** catch (e) ***REMOVED***
      log(e.toString());
      return left(const AppError.serverError(message: 'Unknow Error'));
    ***REMOVED***
  ***REMOVED***

***REMOVED***
  Future<Either<AppError, List<ServiceModel>>> getServiceCategories(
      ***REMOVED***required String id***REMOVED***) async ***REMOVED***
***REMOVED***
      final response = await _reader(firestoreProvider)
          .collection(AppConstant.services)
          .doc(id)
          .collection(AppConstant.categories)
          .get();
      if (response.docs.isNotEmpty) ***REMOVED***
        final _category = List<ServiceModel>.from(
          response.docs.map(
            (category) => ServiceModel.fromJson(category.data()),
          ),
        );
        return right(_category);
      ***REMOVED*** else ***REMOVED***
        return right([]);
      ***REMOVED***
    ***REMOVED*** catch (e) ***REMOVED***
      return left(const AppError.serverError(message: 'Unknow Error'));
    ***REMOVED***
  ***REMOVED***
***REMOVED***

final serviceRemoteSourceProvider =
    Provider<ServiceRemoteSource>((ref) => ServiceRemoteSource(ref.read));
