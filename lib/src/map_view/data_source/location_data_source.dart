***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***
// ***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***
***REMOVED***
***REMOVED***
  ***REMOVED***
***REMOVED***
***REMOVED***
  Future<Either<AppError, String>> getLocationString(
      ***REMOVED***required String lat, required String lng***REMOVED***) async ***REMOVED***
***REMOVED***

***REMOVED***
      final Response response = await dio.get(
          'https://api.mapbox.com/geocoding/v5/mapbox.places/$query.json?access_token=pk.eyJ1IjoidGhlYWF5dXNoIiwiYSI6ImNreWViMTZlejA5dHkydXRlMjdlZHh6d2UifQ.YwuKn1uPwMLudv3V7xqvCw');
***REMOVED***
***REMOVED***
      ***REMOVED*** else ***REMOVED***
***REMOVED***
      ***REMOVED***
    ***REMOVED*** on DioError catch (e) ***REMOVED***
***REMOVED***
***REMOVED***
    ***REMOVED***
  ***REMOVED***

***REMOVED***
  Future<Either<AppError, String>> queryLocation(
      ***REMOVED***required String query***REMOVED***) async ***REMOVED***
***REMOVED***
      final Response response = await dio.get(
          'https://api.mapbox.com/geocoding/v5/mapbox.places/Los%20Angeles.json?access_token=pk.eyJ1IjoidGhlYWF5dXNoIiwiYSI6ImNreWViMTZlejA5dHkydXRlMjdlZHh6d2UifQ.YwuKn1uPwMLudv3V7xqvCw');
***REMOVED***
***REMOVED***
      ***REMOVED*** else ***REMOVED***
***REMOVED***
      ***REMOVED***
    ***REMOVED*** on DioError catch (e) ***REMOVED***
***REMOVED***
    ***REMOVED***
  ***REMOVED***
***REMOVED***

final locationDataSourceProvider =
    Provider<LocationDataSource>((ref) => LocationDataSource());
