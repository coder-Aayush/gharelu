import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDBCollection ***REMOVED***
  const FirebaseDBCollection._();

  static CollectionReference<Map<String, dynamic>> user =
      FirebaseFirestore.instance.collection('users');

  static CollectionReference<Map<String, dynamic>> services =
      FirebaseFirestore.instance.collection('services');
***REMOVED***
