import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
***REMOVED***

final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// final authSatate =
//     StreamProvider((ref) => ref.read(firebaseAuthProvider).authStateChanges());

final storageProvider = Provider<FirebaseStorage>((ref) ***REMOVED***
  return FirebaseStorage.instance;
***REMOVED***);
