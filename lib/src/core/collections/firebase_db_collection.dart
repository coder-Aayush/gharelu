import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDBCollection {
  const FirebaseDBCollection._();

  static CollectionReference<Map<String, dynamic>> user =
      FirebaseFirestore.instance.collection('users');

  static CollectionReference<Map<String, dynamic>> services =
      FirebaseFirestore.instance.collection('services');

  static CollectionReference<Map<String, dynamic>> bookings =
      FirebaseFirestore.instance.collection('bookings');
  static CollectionReference<Map<String, dynamic>> products =
      FirebaseFirestore.instance.collection('products');
}
