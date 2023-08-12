import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gharelu/src/core/constant/app_constant.dart';
import 'package:gharelu/src/core/errors/app_error.dart';
import 'package:gharelu/src/core/extensions/list_extension.dart';
import 'package:gharelu/src/core/helpers/storage_helper.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/home/models/product_model.dart';
import 'package:gharelu/src/home/models/category_model.dart';
import 'package:gharelu/src/home/models/service_model.dart';

abstract class _ServiceRemoteSource {
  Future<Either<AppError, List<CategoryModel>>> getCategories();

  Future<Either<AppError, List<ServiceModel>>> getServices(
      {String? id, bool merchantOnly = false});

  Future<Either<AppError, List<ProductModel>>> getProducts(
      {String? categoryId, String? productId});

  Future<Either<AppError, ServiceModel>> createServices(ServiceModel service);

  Future<Either<AppError, ProductModel>> createProduct(ProductModel product,
      {File? productImage});

  Future<Either<AppError, bool>> deleteProduct(String id);
}

class ServiceRemoteSource implements _ServiceRemoteSource {
  ServiceRemoteSource(this._reader);

  final Ref _reader;
  @override
  Future<Either<AppError, List<CategoryModel>>> getCategories() async {
    try {
      final response = await _reader
          .read(firestoreProvider)
          .collection(AppConstant.categories)
          .get();
      if (response.docs.isNotEmpty) {
        final _service = List<CategoryModel>.from(response.docs
            .map((service) => CategoryModel.fromJson(service.data())));
        return right(_service);
      } else {
        return right([]);
      }
    } catch (e) {
      log(e.toString());
      return left(const AppError.serverError(message: 'Unknow Error'));
    }
  }

  @override
  Future<Either<AppError, List<ServiceModel>>> getServices(
      {String? id, bool merchantOnly = false}) async {
    try {
      // await addAllServices(_reader);
      late QuerySnapshot<Map<String, dynamic>> response;
      if (merchantOnly) {
        final uid = _reader.read(firebaseAuthProvider).currentUser?.uid;
        response = await _reader
            .read(firestoreProvider)
            .collection(AppConstant.services)
            .where('merchant_id', isEqualTo: uid)
            .get();
      } else {
        response = await _reader
            .read(firestoreProvider)
            .collection(AppConstant.services)
            .where('category_id', isEqualTo: id)
            .get();
      }

      if (response.docs.isNotEmpty) {
        final _category = List<ServiceModel>.from(
          response.docs.map(
            (category) => ServiceModel.fromJson(category.data()),
          ),
        );
        return right(_category);
      } else {
        return right([]);
      }
    } on FirebaseException catch (e) {
      print(e.toString());
      return left(AppError.serverError(message: e.message ?? 'Unknow Error'));
    }
  }

  @override
  Future<Either<AppError, List<ProductModel>>> getProducts({
    String? categoryId,
    String? productId,
    bool merchantOnly = false,
  }) async {
    try {
      // late QuerySnapshot<Map<String, dynamic>> response;
      late QuerySnapshot<Map<String, dynamic>> response;
      if (merchantOnly) {
        final currentUser = _reader.read(firebaseAuthProvider).currentUser;
        response = await _reader
            .read(firestoreProvider)
            .collection(AppConstant.products)
            .where('merchant_id', isEqualTo: currentUser?.uid)
            .orderBy('updated_at', descending: true)
            .get();
      } else if (categoryId != null) {
        response = await _reader
            .read(firestoreProvider)
            .collection(AppConstant.products)
            .where('service_id', isEqualTo: categoryId)
            .orderBy('updated_at', descending: true)
            .get();
      } else {
        response = await _reader
            .read(firestoreProvider)
            .collection(AppConstant.products)
            .where('id', isEqualTo: productId)
            .get();
      }
      if (response.docs.isNotEmpty) {
        final products = List<ProductModel>.from(
          response.docs.map(
            (product) {
              final _product = ProductModel.fromJson(product.data());

              return _product;
            },
          ),
        );
        // for (var product in products) {
        //   final _catrgoryResponse = await _reader.read(firestoreProvider)
        //       .collection(AppConstant.categories)
        //       .doc(product.categoryId)
        //       .get();
        //   print(_catrgoryResponse.data());
        //   if (_catrgoryResponse.data() != null) {
        //     final index = products.indexOf(product);
        //     final data = CategoryModel.fromJson(_catrgoryResponse.data()!);
        //     products[index].copyWith(category: data);
        //   }
        // }
        for (var i = 0; i < products.length; i++) {
          final _product = products[i];
          final _categoryResponse = await _reader
              .read(firestoreProvider)
              .collection(AppConstant.categories)
              .doc(_product.categoryId)
              .get();
          final _serviceResponse = await _reader
              .read(firestoreProvider)
              .collection(AppConstant.services)
              .doc(_product.serviceId)
              .get();
          if (_serviceResponse.data() != null) {
            final _data = ServiceModel.fromJson(_serviceResponse.data()!);
            final service = _product.copyWith(service: _data);
            products.update(i, service);
          }
          if (_categoryResponse.data() != null) {
            final _data = CategoryModel.fromJson(_categoryResponse.data()!);
            final prod = _product.copyWith(category: _data);
            products.update(i, prod);
          }
        }
        return right(products);
      } else {
        return right([]);
      }
    } catch (e) {
      log(e.toString());
      return left(const AppError.serverError(message: 'Unknow Error'));
    }
  }

  @override
  Future<Either<AppError, ServiceModel>> createServices(
      ServiceModel service) async {
    try {
      final currentUser = _reader.read(firebaseAuthProvider).currentUser;
      final now = DateTime.now().millisecondsSinceEpoch;
      final ref =
          _reader.read(firestoreProvider).collection(AppConstant.services);
      await ref.doc(ref.id).set(service
          .copyWith(
            id: ref.id,
            merchantId: currentUser!.uid,
            isPromoted: false,
            enable: false,
            updatedAt: now,
            createdAt: now,
          )
          .toJson());

      /// get service
      return right(service);
    } on FirebaseAuthException catch (e) {
      return left(
        AppError.serverError(message: e.message ?? 'Failed to Create Service'),
      );
    } on FirebaseException catch (e) {
      return left(
        AppError.serverError(message: e.message ?? 'Failed to Create Service'),
      );
    }
  }

  Future<Either<AppError, ProductModel>> createProduct(ProductModel product,
      {File? productImage, bool update = false}) async {
    try {
      final now = DateTime.now().millisecondsSinceEpoch;
      final currentUser = await _reader.read(firebaseAuthProvider).currentUser;
      final ref =
          _reader.read(firestoreProvider).collection(AppConstant.products);
      String? url;
      if (productImage != null) {
        url = await StorageHelper.uploadFile(_reader, productImage,
            path: 'merchant');
      }
      if (update) {
        await ref.doc(product.id).update(product.toJson());
      } else {
        final doc = ref.doc().id;
        await ref.doc(doc).set(product
            .copyWith(
              merchantId: currentUser!.uid,
              category: null,
              updatedAt: now,
              createdAt: now,
              id: doc,
              image: url!,
            )
            .toJson());
      }
      return right(product);
    } on FirebaseAuthException catch (e) {
      return left(
        AppError.serverError(message: e.message ?? 'Failed to Create Product'),
      );
    } on FirebaseException catch (e) {
      return left(
        AppError.serverError(message: e.message ?? 'Failed to Create Product'),
      );
    }
  }

  @override
  Future<Either<AppError, bool>> deleteProduct(String id) async {
    try {
      await _reader
          .read(firestoreProvider)
          .collection(AppConstant.products)
          .doc(id)
          .delete();
      return right(true);
    } on FirebaseAuthException catch (e) {
      return left(AppError.serverError(
          message: e.message ?? 'Failed to Delete Product'));
    } on FirebaseException catch (e) {
      return left(AppError.serverError(
          message: e.message ?? 'Failed to Delete Product'));
    }
  }
}

final serviceRemoteSourceProvider = Provider<ServiceRemoteSource>((ref) {
  return ServiceRemoteSource(ref);
});