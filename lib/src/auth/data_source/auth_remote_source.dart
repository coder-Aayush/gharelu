import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gharelu/src/auth/models/custom_user_model.dart';
import 'package:gharelu/src/core/collections/firebase_db_collection.dart';
import 'package:gharelu/src/core/constant/app_constant.dart';
import 'package:gharelu/src/core/enum/auth_type.dart';
import 'package:gharelu/src/core/errors/app_error.dart';
import 'package:gharelu/src/core/helpers/storage_helper.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:logger/logger.dart';

abstract class _AuthRemoteSource {
  Future<Either<AppError, User?>> loginAsUser({
    required String email,
    required String password,
  ***REMOVED***

  Future<Either<AppError, User?>> signupUser({
    required String name,
    required String email,
    required String password,
    required String location,
  ***REMOVED***

  Future<Either<AppError, User?>> merchantLogin({
    required String email,
    required String password,
  ***REMOVED***

  Future<Either<AppError, User?>> merchantSignup({
    required String email,
    required String name,
    required String phoneNumber,
    required String password,
    required List<File> documents,
    required String location,
  ***REMOVED***

  Future<Either<AppError, CustomUserModel>> getUserInfo(
      {required String id, bool isMerchant = false***REMOVED***

  Future<Either<AppError, bool>> deleteUser(
      {String? message, required String password***REMOVED***

  Future<Either<AppError, bool>> logout();
***REMOVED***

class AuthRemoteSource implements _AuthRemoteSource {
  AuthRemoteSource(this._reader) {
    _dateInMulluSecondSinceEpoch = DateTime.now().millisecondsSinceEpoch;
  ***REMOVED***
  late int _dateInMulluSecondSinceEpoch;
  final Ref _reader;
  @override
  Future<Either<AppError, User?>> loginAsUser(
      {required String email, required String password***REMOVED***) async {
    try {
      final response = await _reader.read(firebaseAuthProvider)
          .signInWithEmailAndPassword(email: email, password: password);
      if (response.user != null) {
        final _user = response.user;
        await FirebaseDBCollection.user.doc(_user?.uid).update({
          'updated_at': DateTime.now().millisecondsSinceEpoch,
          'last_login': DateTime.now().millisecondsSinceEpoch,
        ***REMOVED***
        return right(response.user);
      ***REMOVED*** else {
        return left(const AppError.serverError(message: 'Failed to Login'));
      ***REMOVED***
    ***REMOVED*** on FirebaseAuthException catch (e) {
      return left(
          AppError.serverError(message: e.message ?? 'Failed to Login'));
    ***REMOVED***
  ***REMOVED***

  @override
  Future<Either<AppError, User?>> signupUser(
      {required String name,
      required String email,
      required String password,
      required String location***REMOVED***) async {
    try {
      final response = await _reader.read(firebaseAuthProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
      if (response.user != null) {
        final _customUser = CustomUserModel(
          email: email,
          location: location,
          name: name,
          uid: response.user?.uid ?? '',
          updatedAt: _dateInMulluSecondSinceEpoch,
          authType: AuthType.User,
          createdAt: _dateInMulluSecondSinceEpoch,
        );

        await _reader.read(firestoreProvider)
            .collection(AppConstant.users)
            .doc(_customUser.uid)
            .set(_customUser.toJson());
        return right(response.user);
      ***REMOVED*** else {
        return left(const AppError.serverError(message: 'Unknow Eror'));
      ***REMOVED***
    ***REMOVED*** on FirebaseAuthException catch (e) {
      return left(AppError.serverError(message: e.message ?? 'Unknow Eror'));
    ***REMOVED***
  ***REMOVED***

  @override
  Future<Either<AppError, User?>> merchantLogin(
      {required String email, required String password***REMOVED***) async {
    try {
      final response = await _reader.read(firebaseAuthProvider)
          .signInWithEmailAndPassword(email: email, password: password);
      if (response.user != null) {
        final _user = response.user;
        final merchantUser = await _isMerchant(_user?.uid ?? '');
        if (merchantUser) {
          return right(response.user);
        ***REMOVED*** else {
          _reader.read(firebaseAuthProvider).signOut();
          return left(const AppError.serverError(
              message: 'Sorry you are Not a Merchant'));
        ***REMOVED***
      ***REMOVED*** else {
        return left(const AppError.serverError(message: 'Unknow Error'));
      ***REMOVED***
    ***REMOVED*** on FirebaseAuthException catch (e) {
      return left(AppError.serverError(message: e.message ?? 'Unknow Error'));
    ***REMOVED***
  ***REMOVED***

  ***REMOVED***heper class for checking is user is merchant or not
  ///
  ***REMOVED***return `false` if user is not a merchant
  Future<bool> _isMerchant(String userId) async {
    final data = (await _reader.read(firestoreProvider)
            .collection(AppConstant.merchants)
            .doc(userId)
            .get())
        .data();
    log(data.toString());
    if (data != null) {
      final isMerchant = CustomUserModel.fromJson(data).isMerchant;
      return isMerchant;
    ***REMOVED*** else {
      return false;
    ***REMOVED***
  ***REMOVED***

  @override
  Future<Either<AppError, User?>> merchantSignup({
    required String email,
    required String name,
    required String phoneNumber,
    required String password,
    required List<File> documents,
    required String location,
  ***REMOVED***) async {
    try {
      final response =
          await _reader.read(firebaseAuthProvider).createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
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

        await _reader.read(firestoreProvider)
            .collection(AppConstant.merchants)
            .doc(_customUser.uid)
            .set(_customUser.toJson());
        return right(response.user);
      ***REMOVED*** else {
        return left(const AppError.serverError(message: 'Unknow Error'));
      ***REMOVED***
    ***REMOVED*** on FirebaseAuthException catch (e) {
      return left(AppError.serverError(message: e.message ?? 'Unknow Error'));
    ***REMOVED*** on FirebaseException catch (e) {
      return left(AppError.serverError(message: e.message ?? 'Unknow Error'));
    ***REMOVED***
  ***REMOVED***

  @override
  Future<Either<AppError, CustomUserModel>> getUserInfo(
      {required String id, bool isMerchant = false***REMOVED***) async {
    try {
      late DocumentSnapshot<Map<String, dynamic>> response;
      if (isMerchant) {
        response = await _reader.read(firestoreProvider)
            .collection(AppConstant.merchants)
            .doc(id)
            .get();
      ***REMOVED*** else {
        response = await _reader.read(firestoreProvider)
            .collection(AppConstant.users)
            .doc(id)
            .get();
      ***REMOVED***
      if (response.data() != null) {
        return right(CustomUserModel.fromJson(response.data()!));
      ***REMOVED*** else {
        return left(
            const AppError.serverError(message: 'Failed to Get User Info'));
      ***REMOVED***
    ***REMOVED*** on FirebaseException catch (e) {
      return left(AppError.serverError(message: e.message ?? 'Unknow Error'));
    ***REMOVED***
  ***REMOVED***

  @override
  Future<Either<AppError, bool>> deleteUser({
    String? message,
    required String password,
    bool isMerchant = false,
  ***REMOVED***) async {
    try {
      final now = DateTime.now().millisecondsSinceEpoch;
      final currentUser = _reader.read(firebaseAuthProvider).currentUser;

      final response = await _reader.read(firebaseAuthProvider)
          .currentUser
          ?.reauthenticateWithCredential(
            EmailAuthProvider.credential(
              email: currentUser!.email!,
              password: password,
            ),
          );
      if (response != null) {
        await Future.wait(Iterable.castFrom([
          _reader.read(firestoreProvider).collection(AppConstant.feedback).add({
            'message': message,
            'user_id': currentUser?.uid,
            'email': currentUser?.email,
            'created_at': now,
            'updated_at': now,
          ***REMOVED***),
          _reader.read(firestoreProvider)
              .collection(
                  isMerchant ? AppConstant.merchants : AppConstant.users)
              .doc(currentUser?.uid)
              .delete(),
          _reader.read(firebaseAuthProvider).currentUser?.delete(),
        ]));
        return right(true);
      ***REMOVED*** else {
        return left(
            const AppError.serverError(message: 'Failed to Delete User'));
      ***REMOVED***
    ***REMOVED*** on FirebaseAuthException catch (e) {
      return left(
          AppError.serverError(message: e.message ?? 'Failed to Delete User'));
    ***REMOVED*** on FirebaseException catch (e) {
      return left(
          AppError.serverError(message: e.message ?? 'Failed to Delete User'));
    ***REMOVED***
  ***REMOVED***

  @override
  Future<Either<AppError, bool>> logout() async {
    try {
      await _reader.read(firebaseAuthProvider).signOut();
      return right(true);
    ***REMOVED*** on FirebaseAuthException catch (e) {
      return left(
          AppError.serverError(message: e.message ?? 'Failed to Delete User'));
    ***REMOVED*** on FirebaseException catch (e) {
      return left(
          AppError.serverError(message: e.message ?? 'Failed to Delete User'));
    ***REMOVED***
  ***REMOVED***
***REMOVED***

final authRemoteSourceProvider =
    Provider<AuthRemoteSource>((ref) => AuthRemoteSource(ref));
