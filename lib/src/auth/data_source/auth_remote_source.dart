import 'dart:async';
***REMOVED***
import 'dart:io';
***REMOVED***
import 'package:firebase_auth/firebase_auth.dart';
***REMOVED***
import 'package:gharelu/src/auth/models/custom_user_model.dart';
import 'package:gharelu/src/core/collections/firebase_db_collection.dart';
import 'package:gharelu/src/core/constant/app_constant.dart';
import 'package:gharelu/src/core/enum/auth_type.dart';
***REMOVED***
import 'package:gharelu/src/core/helpers/storage_helper.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:logger/logger.dart';

abstract class _AuthRemoteSource ***REMOVED***
  Future<Either<AppError, User?>> loginAsUser(***REMOVED***
    required String email,
    required String password,
***REMOVED***

  Future<Either<AppError, User?>> signupUser(***REMOVED***
    required String name,
    required String email,
    required String password,
    required String location,
***REMOVED***

  Future<Either<AppError, User?>> merchantLogin(***REMOVED***
    required String email,
    required String password,
***REMOVED***

  Future<Either<AppError, User?>> merchantSignup(***REMOVED***
    required String email,
    required String name,
    required String phoneNumber,
    required String password,
    required List<File> documents,
    required String location,
***REMOVED***
***REMOVED***

class AuthRemoteSource implements _AuthRemoteSource ***REMOVED***
  AuthRemoteSource(this._reader) ***REMOVED***
    _dateInMulluSecondSinceEpoch = DateTime.now().millisecondsSinceEpoch;
  ***REMOVED***
  late int _dateInMulluSecondSinceEpoch;
  final Reader _reader;
***REMOVED***
  Future<Either<AppError, User?>> loginAsUser(
      ***REMOVED***required String email, required String password***REMOVED***) async ***REMOVED***
***REMOVED***
      final response = await _reader(firebaseAuthProvider)
          .signInWithEmailAndPassword(email: email, password: password);
      if (response.user != null) ***REMOVED***
        final _user = response.user;
        await FirebaseDBCollection.user.doc(_user?.uid).set(***REMOVED***
          'updated_at': DateTime.now().millisecondsSinceEpoch,
          'last_login': DateTime.now().millisecondsSinceEpoch,
      ***REMOVED***
        return right(response.user);
      ***REMOVED*** else ***REMOVED***
        return left(const AppError.serverError(message: 'Failed to Login'));
      ***REMOVED***
    ***REMOVED*** on FirebaseAuthException catch (e) ***REMOVED***
      return left(
          AppError.serverError(message: e.message ?? 'Failed to Login'));
    ***REMOVED***
  ***REMOVED***

***REMOVED***
  Future<Either<AppError, User?>> signupUser(
      ***REMOVED***required String name,
      required String email,
      required String password,
      required String location***REMOVED***) async ***REMOVED***
***REMOVED***
      final response = await _reader(firebaseAuthProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
      if (response.user != null) ***REMOVED***
        final _customUser = CustomUserModel(
          email: email,
          location: location,
          name: name,
          uid: response.user?.uid ?? '',
          updatedAt: _dateInMulluSecondSinceEpoch,
          authType: AuthType.User,
          createdAt: _dateInMulluSecondSinceEpoch,
        );

        await _reader(firestoreProvider)
            .collection(AppConstant.users)
            .doc(_customUser.uid)
            .set(_customUser.toJson());
        return right(response.user);
      ***REMOVED*** else ***REMOVED***
        return left(const AppError.serverError(message: 'Unknow Eror'));
      ***REMOVED***
    ***REMOVED*** on FirebaseAuthException catch (e) ***REMOVED***
      return left(AppError.serverError(message: e.message ?? 'Unknow Eror'));
    ***REMOVED***
  ***REMOVED***

***REMOVED***
  Future<Either<AppError, User?>> merchantLogin(
      ***REMOVED***required String email, required String password***REMOVED***) async ***REMOVED***
***REMOVED***
      final response = await _reader(firebaseAuthProvider)
          .signInWithEmailAndPassword(email: email, password: password);
      if (response.user != null) ***REMOVED***
        final _user = response.user;
        final merchantUser = await _isMerchant(_user?.uid ?? '');
        if (merchantUser) ***REMOVED***
          return right(response.user);
        ***REMOVED*** else ***REMOVED***
          _reader(firebaseAuthProvider).signOut();
          return left(const AppError.serverError(
              message: 'Sorry you are Not a Merchant'));
        ***REMOVED***
      ***REMOVED*** else ***REMOVED***
***REMOVED***
      ***REMOVED***
    ***REMOVED*** on FirebaseAuthException catch (e) ***REMOVED***
      return left(AppError.serverError(message: e.message ?? 'Unknow Error'));
    ***REMOVED***
  ***REMOVED***

  ***REMOVED***heper class for checking is user is merchant or not
  ///
  ***REMOVED***return `false` if user is not a merchant
  Future<bool> _isMerchant(String userId) async ***REMOVED***
    final data = (await _reader(firestoreProvider)
            .collection('merchant')
            .doc(userId)
            .get())
        .data();
    log(data.toString());
    if (data != null) ***REMOVED***
      final isMerchant = CustomUserModel.fromJson(data).isMerchant;
      return isMerchant;
    ***REMOVED*** else ***REMOVED***
      return false;
    ***REMOVED***
  ***REMOVED***

***REMOVED***
  Future<Either<AppError, User?>> merchantSignup(***REMOVED***
    required String email,
    required String name,
    required String phoneNumber,
    required String password,
    required List<File> documents,
    required String location,
  ***REMOVED***) async ***REMOVED***
***REMOVED***
      final response =
          await _reader(firebaseAuthProvider).createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (response.user != null) ***REMOVED***
        final docs =
            await StorageHelper.uploadFiles(_reader, documents, path: 'users');
        Logger().d(docs);
        log(docs.toString());
        final _customUser = CustomUserModel(
          email: email,
          location: location,
          name: name,
          uid: response.user?.uid ?? '',
          updatedAt: _dateInMulluSecondSinceEpoch,
          authType: AuthType.Merchant,
          isMerchant: true,
          createdAt: _dateInMulluSecondSinceEpoch,
          documents: docs,
          phoneNumber: phoneNumber,
        );

        await _reader(firestoreProvider)
            .collection(AppConstant.merchants)
            .doc(_customUser.uid)
            .set(_customUser.toJson());
        return right(response.user);
      ***REMOVED*** else ***REMOVED***
***REMOVED***
      ***REMOVED***
    ***REMOVED*** on FirebaseAuthException catch (e) ***REMOVED***
      return left(AppError.serverError(message: e.message ?? 'Unknow Error'));
    ***REMOVED*** on FirebaseException catch (e) ***REMOVED***
      return left(AppError.serverError(message: e.message ?? 'Unknow Error'));
    ***REMOVED***
  ***REMOVED***
***REMOVED***

final authRemoteSourceProvider =
    Provider<AuthRemoteSource>((ref) => AuthRemoteSource(ref.read));
