import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:dio/dio.dart';
import 'package:gharelu/src/core/errors/app_error.dart';

abstract class _LocationDataSource {
  Future<Either<AppError, String>> getLocationString({
    required String lat,
    required String lng,
  });

  Future<Either<AppError, String>> queryLocation({
    required String query,
  });

  Future<Either<AppError, String>> getLocationFromGeoCordinates({
    required String lat,
    required String lng,
  });
}

class LocationDataSource implements _LocationDataSource {
  LocationDataSource() {
    dio = Dio();
    _apiKey = dotenv.env['MAPBOX_KEY']!;
    _googleMapKey = dotenv.env['GOOGLE_MAP_API_KEY']!;
  }
  late final Dio dio;
  late final String _apiKey;
  late final String _googleMapKey;

  @override
  Future<Either<AppError, String>> getLocationString(
      {required String lat, required String lng}) async {
    String query = '$lat,$lng';

    try {
      final Response response = await dio.get(
          'https://api.mapbox.com/geocoding/v5/mapbox.places/$query.json?access_token=$_apiKey');
      if (response.statusCode == 200) {
        return right(response.data.toString());
      } else {
        return left(const AppError.serverError(message: 'Unknow Error'));
      }
    } on DioException catch (e) {
      log(e.error.toString());
      return left(AppError.serverError(message: e.message!));
    }
  }

  @override
  Future<Either<AppError, String>> queryLocation(
      {required String query}) async {
    try {
      final Response response = await dio.get(
          'https://api.mapbox.com/geocoding/v5/mapbox.places/$query.json?access_token=$_apiKey');
      if (response.statusCode == 200) {
        return right(response.data.toString());
      } else {
        return left(const AppError.serverError(message: 'Unknow Error'));
      }
    } on DioException catch (e) {
      return left(AppError.serverError(message: e.message!));
    }
  }

  @override
  Future<Either<AppError, String>> getLocationFromGeoCordinates(
      {required String lat, required String lng}) async {
    try {
      String path =
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$_googleMapKey';
      final Response response = await dio.get(path);
      if (response.data != null) {
        log(response.data['results'][0]['formatted_address'].toString());
        return right(
            response.data['results'][0]['formatted_address'].toString());
      } else {
        return left(AppError.serverError(
            message: response.data['error_message'].toString()));
      }
    } on DioException catch (e) {
      return left(AppError.serverError(message: e.message!));
    }
  }
}

final locationDataSourceProvider =
    Provider<LocationDataSource>((ref) => LocationDataSource());
