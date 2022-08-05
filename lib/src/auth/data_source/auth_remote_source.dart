***REMOVED***
import 'package:firebase_auth/firebase_auth.dart';
***REMOVED***
***REMOVED***

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
***REMOVED***

class AuthRemoteSource implements _AuthRemoteSource ***REMOVED***
***REMOVED***
  Future<Either<AppError, User?>> loginAsUser(
      ***REMOVED***required String email, required String password***REMOVED***) async ***REMOVED***
***REMOVED***
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (response.user != null) ***REMOVED***
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
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (response.user != null) ***REMOVED***
        return right(response.user);
      ***REMOVED*** else ***REMOVED***
        return left(const AppError.serverError(message: 'Unknow Eror'));
      ***REMOVED***
    ***REMOVED*** on FirebaseAuthException catch (e) ***REMOVED***
      return left(AppError.serverError(message: e.message ?? 'Unknow Eror'));
    ***REMOVED***
  ***REMOVED***
***REMOVED***

final authRemoteSourceProvider =
    Provider<AuthRemoteSource>((ref) => AuthRemoteSource());
