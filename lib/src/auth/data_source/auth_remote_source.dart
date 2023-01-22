import 'dart:async';
***REMOVED***
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<Either<AppError, CustomUserModel>> getUserInfo(
      ***REMOVED***required String id, bool isMerchant = false***REMOVED***);

  Future<Either<AppError, bool>> deleteUser(
      ***REMOVED***String? message, required String password***REMOVED***);

  Future<Either<AppError, bool>> logout();
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
        await FirebaseDBCollection.user.doc(_user?.uid).update(***REMOVED***
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
            .collection(AppConstant.merchants)
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
  Future<Either<AppError, CustomUserModel>> getUserInfo(
      ***REMOVED***required String id, bool isMerchant = false***REMOVED***) async ***REMOVED***
***REMOVED***
      late DocumentSnapshot<Map<String, dynamic>> response;
      if (isMerchant) ***REMOVED***
        response = await _reader(firestoreProvider)
            .collection(AppConstant.merchants)
            .doc(id)
            .get();
      ***REMOVED*** else ***REMOVED***
        response = await _reader(firestoreProvider)
            .collection(AppConstant.users)
            .doc(id)
            .get();
      ***REMOVED***
      if (response.data() != null) ***REMOVED***
        return right(CustomUserModel.fromJson(response.data()!));
      ***REMOVED*** else ***REMOVED***
        return left(
            const AppError.serverError(message: 'Failed to Get User Info'));
      ***REMOVED***
    ***REMOVED*** on FirebaseException catch (e) ***REMOVED***
      return left(AppError.serverError(message: e.message ?? 'Unknow Error'));
    ***REMOVED***
  ***REMOVED***

***REMOVED***
  Future<Either<AppError, bool>> deleteUser(
      ***REMOVED***String? message, required String password***REMOVED***) async ***REMOVED***
***REMOVED***
      final now = DateTime.now().millisecondsSinceEpoch;
      final currentUser = _reader(firebaseAuthProvider).currentUser;

      final response = await _reader(firebaseAuthProvider)
          .currentUser
          ?.reauthenticateWithCredential(
            EmailAuthProvider.credential(
              email: currentUser!.email!,
              password: password,
            ),
          );
      if (response != null) ***REMOVED***
        await Future.wait(Iterable.castFrom([
          _reader(firestoreProvider).collection(AppConstant.feedback).add(***REMOVED***
            'message': message,
            'user_id': currentUser?.uid,
            'email': currentUser?.email,
            'created_at': now,
            'updated_at': now,
          ***REMOVED***),
          _reader(firestoreProvider)
              .collection(AppConstant.users)
              .doc(currentUser?.uid)
              .delete(),
          _reader(firebaseAuthProvider).currentUser?.delete(),
        ]));
        return right(true);
      ***REMOVED*** else ***REMOVED***
        return left(
            const AppError.serverError(message: 'Failed to Delete User'));
      ***REMOVED***
    ***REMOVED*** on FirebaseAuthException catch (e) ***REMOVED***
      return left(
          AppError.serverError(message: e.message ?? 'Failed to Delete User'));
    ***REMOVED*** on FirebaseException catch (e) ***REMOVED***
      return left(
          AppError.serverError(message: e.message ?? 'Failed to Delete User'));
    ***REMOVED***
  ***REMOVED***

***REMOVED***
  Future<Either<AppError, bool>> logout() async ***REMOVED***
***REMOVED***
      await _reader(firebaseAuthProvider).signOut();
      return right(true);
    ***REMOVED*** on FirebaseAuthException catch (e) ***REMOVED***
      return left(
          AppError.serverError(message: e.message ?? 'Failed to Delete User'));
    ***REMOVED*** on FirebaseException catch (e) ***REMOVED***
      return left(
          AppError.serverError(message: e.message ?? 'Failed to Delete User'));
    ***REMOVED***
  ***REMOVED***
***REMOVED***

final authRemoteSourceProvider =
    Provider<AuthRemoteSource>((ref) => AuthRemoteSource(ref.read));
