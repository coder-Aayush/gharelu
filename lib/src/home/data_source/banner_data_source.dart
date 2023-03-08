import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gharelu/src/core/constant/app_constant.dart';
import 'package:gharelu/src/core/errors/app_error.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/home/models/banner_model.dart';

abstract class _BannerRemoteSource {
  Future<Either<AppError, List<BannerModel>>> getBanners();
}

class BannerRemoteSource implements _BannerRemoteSource {
  BannerRemoteSource(this._reader);

  final Ref _reader;
  @override
  Future<Either<AppError, List<BannerModel>>> getBanners() async {
    try {
      _reader.read(firebaseAuthProvider).authStateChanges().listen((event) {
        log(event.toString());
      });
      final response = await _reader.read(firestoreProvider)
          .collection(AppConstant.banners)
          .get();
      if (response.docs.isNotEmpty) {
        return right(response.docs
            .map((banner) => BannerModel.fromJson(banner.data()))
            .toList());
      } else {
        return right([]);
      }
    } catch (e) {
      log(e.toString());
      return left(
          const AppError.serverError(message: 'Failed to Fetch Banners'));
    }
  }
}

final bannerRemoteSourceProvider =
    Provider<BannerRemoteSource>((ref) => BannerRemoteSource(ref));
