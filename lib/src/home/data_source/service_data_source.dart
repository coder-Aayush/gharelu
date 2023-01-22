***REMOVED***
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
***REMOVED***
import 'package:firebase_auth/firebase_auth.dart';
***REMOVED***
import 'package:gharelu/src/core/constant/app_constant.dart';
***REMOVED***
import 'package:gharelu/src/core/extensions/list_extension.dart';
import 'package:gharelu/src/core/helpers/storage_helper.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/home/models/product_model.dart';
import 'package:gharelu/src/home/models/category_model.dart';
import 'package:gharelu/src/home/models/service_model.dart';

abstract class _ServiceRemoteSource ***REMOVED***
  Future<Either<AppError, List<CategoryModel>>> getCategories();

  Future<Either<AppError, List<ServiceModel>>> getServices(
      ***REMOVED***String? id, bool merchantOnly = false***REMOVED***);

  Future<Either<AppError, List<ProductModel>>> getProducts(
      ***REMOVED***String? categoryId, String? productId***REMOVED***);

  Future<Either<AppError, ServiceModel>> createServices(ServiceModel service);

  Future<Either<AppError, ProductModel>> createProduct(ProductModel product,
      ***REMOVED***File? productImage***REMOVED***);

  Future<Either<AppError, bool>> deleteProduct(String id);
***REMOVED***

class ServiceRemoteSource implements _ServiceRemoteSource ***REMOVED***
  ServiceRemoteSource(this._reader);

  final Reader _reader;
***REMOVED***
  Future<Either<AppError, List<CategoryModel>>> getCategories() async ***REMOVED***
***REMOVED***
      final response = await _reader(firestoreProvider)
          .collection(AppConstant.categories)
          .get();
      if (response.docs.isNotEmpty) ***REMOVED***
        final _service = List<CategoryModel>.from(response.docs
            .map((service) => CategoryModel.fromJson(service.data())));
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
  Future<Either<AppError, List<ServiceModel>>> getServices(
      ***REMOVED***String? id, bool merchantOnly = false***REMOVED***) async ***REMOVED***
***REMOVED***
      late QuerySnapshot<Map<String, dynamic>> response;
      if (merchantOnly) ***REMOVED***
        final uid = _reader(firebaseAuthProvider).currentUser?.uid;
        response = await _reader(firestoreProvider)
            .collection(AppConstant.services)
            .where('merchant_id', isEqualTo: uid)
            .get();
      ***REMOVED*** else ***REMOVED***
        response = await _reader(firestoreProvider)
            .collection(AppConstant.services)
            .where('category_id', isEqualTo: id)
            .get();
      ***REMOVED***

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
    ***REMOVED*** on FirebaseException catch (e) ***REMOVED***
      print(e.toString());
      return left(AppError.serverError(message: e.message ?? 'Unknow Error'));
    ***REMOVED***
  ***REMOVED***

***REMOVED***
  Future<Either<AppError, List<ProductModel>>> getProducts(***REMOVED***
    String? categoryId,
    String? productId,
    bool merchantOnly = false,
  ***REMOVED***) async ***REMOVED***
***REMOVED***
      // late QuerySnapshot<Map<String, dynamic>> response;
      late QuerySnapshot<Map<String, dynamic>> response;
      if (merchantOnly) ***REMOVED***
        final currentUser = _reader(firebaseAuthProvider).currentUser;
        response = await _reader(firestoreProvider)
            .collection(AppConstant.products)
            .where('merchant_id', isEqualTo: currentUser?.uid)
            .orderBy('updated_at', descending: true)
            .get();
      ***REMOVED*** else if (categoryId != null) ***REMOVED***
        response = await _reader(firestoreProvider)
            .collection(AppConstant.products)
            .where('service_id', isEqualTo: categoryId)
            .orderBy('updated_at', descending: true)
            .get();
      ***REMOVED*** else ***REMOVED***
        response = await _reader(firestoreProvider)
            .collection(AppConstant.products)
            .where('id', isEqualTo: productId)
            .get();
      ***REMOVED***
      if (response.docs.isNotEmpty) ***REMOVED***
        final products = List<ProductModel>.from(
          response.docs.map(
            (product) ***REMOVED***
              final _product = ProductModel.fromJson(product.data());

              return _product;
            ***REMOVED***,
          ),
        );
        // for (var product in products) ***REMOVED***
        //   final _catrgoryResponse = await _reader(firestoreProvider)
        //       .collection(AppConstant.categories)
        //       .doc(product.categoryId)
        //       .get();
        //   print(_catrgoryResponse.data());
        //   if (_catrgoryResponse.data() != null) ***REMOVED***
        //     final index = products.indexOf(product);
        //     final data = CategoryModel.fromJson(_catrgoryResponse.data()!);
        //     products[index].copyWith(category: data);
        //   ***REMOVED***
        // ***REMOVED***
        for (var i = 0; i < products.length; i++) ***REMOVED***
          final _product = products[i];
          final _categoryResponse = await _reader(firestoreProvider)
              .collection(AppConstant.categories)
              .doc(_product.categoryId)
              .get();
          final _serviceResponse = await _reader(firestoreProvider)
              .collection(AppConstant.services)
              .doc(_product.serviceId)
              .get();
          if (_serviceResponse.data() != null) ***REMOVED***
            final _data = ServiceModel.fromJson(_serviceResponse.data()!);
            final service = _product.copyWith(service: _data);
            products.update(i, service);
          ***REMOVED***
          if (_categoryResponse.data() != null) ***REMOVED***
            final _data = CategoryModel.fromJson(_categoryResponse.data()!);
            final prod = _product.copyWith(category: _data);
            products.update(i, prod);
          ***REMOVED***
        ***REMOVED***
        return right(products);
      ***REMOVED*** else ***REMOVED***
        return right([]);
      ***REMOVED***
    ***REMOVED*** catch (e) ***REMOVED***
      log(e.toString());
      return left(const AppError.serverError(message: 'Unknow Error'));
    ***REMOVED***
  ***REMOVED***

***REMOVED***
  Future<Either<AppError, ServiceModel>> createServices(
      ServiceModel service) async ***REMOVED***
***REMOVED***
      final currentUser = _reader(firebaseAuthProvider).currentUser;
      final now = DateTime.now().millisecondsSinceEpoch;
      final ref = _reader(firestoreProvider).collection(AppConstant.services);
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

      ***REMOVED***get service
      return right(service);
    ***REMOVED*** on FirebaseAuthException catch (e) ***REMOVED***
      return left(
        AppError.serverError(message: e.message ?? 'Failed to Create Service'),
      );
    ***REMOVED*** on FirebaseException catch (e) ***REMOVED***
      return left(
        AppError.serverError(message: e.message ?? 'Failed to Create Service'),
      );
    ***REMOVED***
  ***REMOVED***

  Future<Either<AppError, ProductModel>> createProduct(ProductModel product,
      ***REMOVED***File? productImage, bool update = false***REMOVED***) async ***REMOVED***
***REMOVED***
      final now = DateTime.now().millisecondsSinceEpoch;
      final currentUser = await _reader(firebaseAuthProvider).currentUser;
      final ref = _reader(firestoreProvider).collection(AppConstant.products);
      String? url;
      if (productImage != null) ***REMOVED***
        url = await StorageHelper.uploadFile(_reader, productImage,
            path: 'merchant');
      ***REMOVED***
      if (update) ***REMOVED***
        await ref.doc(product.id).update(product.toJson());
      ***REMOVED*** else ***REMOVED***
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
      ***REMOVED***
      return right(product);
    ***REMOVED*** on FirebaseAuthException catch (e) ***REMOVED***
      return left(
        AppError.serverError(message: e.message ?? 'Failed to Create Product'),
      );
    ***REMOVED*** on FirebaseException catch (e) ***REMOVED***
      return left(
        AppError.serverError(message: e.message ?? 'Failed to Create Product'),
      );
    ***REMOVED***
  ***REMOVED***

***REMOVED***
  Future<Either<AppError, bool>> deleteProduct(String id) async ***REMOVED***
***REMOVED***
      await _reader(firestoreProvider)
          .collection(AppConstant.products)
          .doc(id)
          .delete();
      return right(true);
    ***REMOVED*** on FirebaseAuthException catch (e) ***REMOVED***
      return left(AppError.serverError(
          message: e.message ?? 'Failed to Delete Product'));
    ***REMOVED*** on FirebaseException catch (e) ***REMOVED***
      return left(AppError.serverError(
          message: e.message ?? 'Failed to Delete Product'));
    ***REMOVED***
  ***REMOVED***
***REMOVED***

final serviceRemoteSourceProvider =
    Provider<ServiceRemoteSource>((ref) => ServiceRemoteSource(ref.read));
