import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gharelu/src/core/errors/app_error.dart';

abstract class _AuthRemoteSource {
  Future<Either<AppError, User?>> loginAsUser({
    required String email,
    required String password,
  });
}

class AuthRemoteSource implements _AuthRemoteSource {
  @override
  Future<Either<AppError, User?>> loginAsUser(
      {required String email, required String password}) async {
    try {
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (response.user != null) {
        return right(response.user);
      } else {
        return left(const AppError.serverError(message: 'Failed to Login'));
      }
    } on FirebaseAuthException catch (e) {
      return left(
          AppError.serverError(message: e.message ?? 'Failed to Login'));
    }
  }
}

final authRemoteSourceProvider = Provider<AuthRemoteSource>((ref) => AuthRemoteSource());
