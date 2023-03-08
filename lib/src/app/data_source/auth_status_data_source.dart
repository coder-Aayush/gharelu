import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gharelu/src/auth/models/custom_user_model.dart';
import 'package:gharelu/src/core/constant/app_constant.dart';
import 'package:gharelu/src/core/errors/app_error.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthStatusDataSource {
  AuthStatusDataSource(this._firestore);

  final FirebaseFirestore _firestore;
  Future<Either<AppError, CustomUserModel>> authSatus(
      {required String id}) async {
    try {
      /// check if current user is merchant or normal user
      ///
      final user =
          (await _firestore.collection(AppConstant.users).doc(id).get());
      if (user.exists && user.data() != null) {
        return right(CustomUserModel.fromJson(user.data()!));
      }
      final merchant =
          await _firestore.collection(AppConstant.merchants).doc(id).get();
      if (merchant.exists && merchant.data() != null) {
        return right(CustomUserModel.fromJson(merchant.data()!));
      }
      return left(const AppError.serverError(message: 'UnAuthenticated'));
    } on FirebaseAuthException catch (e) {
      return left(
          AppError.serverError(message: e.message ?? 'UnAuthenticated'));
    } on FirebaseException catch (e) {
      return left(
          AppError.serverError(message: e.message ?? 'UnAuthenticated'));
    }
  }
}

final authStatusDataSourceProvider = Provider<AuthStatusDataSource>((ref) {
  return AuthStatusDataSource(ref.read(firestoreProvider));
});
