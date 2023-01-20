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
***REMOVED***
    _apiKey =
        'pk.eyJ1IjoidGhlYWF5dXNoIiwiYSI6ImNreWViMTZlejA5dHkydXRlMjdlZHh6d2UifQ.YwuKn1uPwMLudv3V7xqvCw';
    _googleMapKey = 'AIzaSyBJ5TCwnBBtao--_Z2E-jxkcBVGbAG6W94';
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
          'https://api.mapbox.com/geocoding/v5/mapbox.places/$query.json?access_token=$_apiKey');
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
          'https://api.mapbox.com/geocoding/v5/mapbox.places/$query.json?access_token=$_apiKey');
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
  Future<Either<AppError, String>> getLocationFromGeoCordinates(
      ***REMOVED***required String lat, required String lng***REMOVED***) async ***REMOVED***
***REMOVED***
      String path =
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$_googleMapKey';
***REMOVED***
***REMOVED***
***REMOVED***
        return right(
            response.data['results'][0]['formatted_address'].toString());
      ***REMOVED*** else ***REMOVED***
        return left(AppError.serverError(
            message: response.data['error_message'].toString()));
      ***REMOVED***
    ***REMOVED*** on DioError catch (e) ***REMOVED***
***REMOVED***
    ***REMOVED***
  ***REMOVED***
***REMOVED***

final locationDataSourceProvider =
    Provider<LocationDataSource>((ref) => LocationDataSource());
