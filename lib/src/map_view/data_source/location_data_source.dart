import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
}

class LocationDataSource implements _LocationDataSource {
  LocationDataSource() {
    dio = Dio();
  }
  late final Dio dio;
  @override
  Future<Either<AppError, String>> getLocationString(
      {required String lat, required String lng}) async {
    String query = '$lat,$lng';

    try {
      final Response response = await dio.get(
          'https://api.mapbox.com/geocoding/v5/mapbox.places/$query.json?access_token=pk.eyJ1IjoidGhlYWF5dXNoIiwiYSI6ImNreWViMTZlejA5dHkydXRlMjdlZHh6d2UifQ.YwuKn1uPwMLudv3V7xqvCw');
      if (response.statusCode == 200) {
        return right(response.data.toString());
      } else {
        return left(const AppError.serverError(message: 'Unknow Error'));
      }
    } on DioError catch (e) {
      log(e.error.toString());
      return left(AppError.serverError(message: e.message));
    }
  }

  @override
  Future<Either<AppError, String>> queryLocation(
      {required String query}) async {
    try {
      final Response response = await dio.get(
          'https://api.mapbox.com/geocoding/v5/mapbox.places/Los%20Angeles.json?access_token=pk.eyJ1IjoidGhlYWF5dXNoIiwiYSI6ImNreWViMTZlejA5dHkydXRlMjdlZHh6d2UifQ.YwuKn1uPwMLudv3V7xqvCw');
      if (response.statusCode == 200) {
        return right(response.data.toString());
      } else {
        return left(const AppError.serverError(message: 'Unknow Error'));
      }
    } on DioError catch (e) {
      return left(AppError.serverError(message: e.message));
    }
  }
}

final locationDataSourceProvider =
    Provider<LocationDataSource>((ref) => LocationDataSource());
