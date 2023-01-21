import 'package:cloud_firestore/cloud_firestore.dart';
***REMOVED***
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gharelu/src/auth/models/custom_user_model.dart';
import 'package:gharelu/src/core/constant/app_constant.dart';
***REMOVED***
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthStatusDataSource ***REMOVED***
  AuthStatusDataSource(this._firestore);

  final FirebaseFirestore _firestore;
  Future<Either<AppError, CustomUserModel>> authSatus(
      ***REMOVED***required String id***REMOVED***) async ***REMOVED***
***REMOVED***
      ***REMOVED***check if current user is merchant or normal user
      ///
      final user =
          (await _firestore.collection(AppConstant.users).doc(id).get());
      if (user.exists && user.data() != null) ***REMOVED***
        return right(CustomUserModel.fromJson(user.data()!));
      ***REMOVED***
      final merchant =
          await _firestore.collection(AppConstant.merchants).doc(id).get();
      if (merchant.exists && merchant.data() != null) ***REMOVED***
        return right(CustomUserModel.fromJson(merchant.data()!));
      ***REMOVED***
      return left(const AppError.serverError(message: 'UnAuthenticated'));
    ***REMOVED*** on FirebaseAuthException catch (e) ***REMOVED***
      return left(
          AppError.serverError(message: e.message ?? 'UnAuthenticated'));
    ***REMOVED*** on FirebaseException catch (e) ***REMOVED***
      return left(
          AppError.serverError(message: e.message ?? 'UnAuthenticated'));
    ***REMOVED***
  ***REMOVED***
***REMOVED***

final authStatusDataSourceProvider = Provider<AuthStatusDataSource>((ref) ***REMOVED***
  return AuthStatusDataSource(ref.read(firestoreProvider));
***REMOVED***);
