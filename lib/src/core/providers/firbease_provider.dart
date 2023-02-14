import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
***REMOVED***
import 'package:gharelu/main.dart';
import 'package:gharelu/src/core/extensions/context_extension.dart';
import 'package:gharelu/src/core/routes/app_router.dart';

final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) ***REMOVED***
    final instance = FirebaseAuth.instance;
    // if (instance.currentUser != null) ***REMOVED***
    //   sendVerificationEmail(instance.currentUser!);
    // ***REMOVED***
    return instance;
  ***REMOVED***,
);

final authChangeProvider = StreamProvider<User?>((ref) async* ***REMOVED***
    yield* ref.read(firebaseAuthProvider).authStateChanges()
      ..listen((event) ***REMOVED***
        if (event != null) ***REMOVED***
          final _router = getIt<AppRouter>();
          sendVerificationEmail(event);
          if (event.emailVerified == false) ***REMOVED***
            _router.navigatorKey.currentContext?.showSnackbar(
              message: 'Email not Verified',
            );
            Future.delayed(
              Duration.zero,
              () => _router.push(VerifyEmailRoute(email: event.email!)),
            );
          ***REMOVED***
        ***REMOVED***
    ***REMOVED***
***REMOVED***,
);

// final authSatate =
//     StreamProvider((ref) => ref.read(firebaseAuthProvider).authStateChanges());

final storageProvider = Provider<FirebaseStorage>((ref) ***REMOVED***
  return FirebaseStorage.instance;
***REMOVED***);

Future<void> sendVerificationEmail(User currentUser) async ***REMOVED***
  if (currentUser.emailVerified == false) ***REMOVED***
    currentUser.sendEmailVerification().then(
      (value) ***REMOVED***
        getIt<AppRouter>().navigatorKey.currentContext?.showSnackbar(
              message: 'Verification Email Sent to $***REMOVED***currentUser.email***REMOVED***',
            );
      ***REMOVED***,
    );
  ***REMOVED***
***REMOVED***
