import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gharelu/src/auth/models/custom_user_model.dart';
import 'package:gharelu/src/chat/models/message_model.dart';
import 'package:gharelu/src/chat/models/room_model.dart';
import 'package:gharelu/src/core/constant/app_constant.dart';
import 'package:gharelu/src/core/errors/app_error.dart';
import 'package:gharelu/src/core/helpers/storage_helper.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../home/models/product_model.dart';

class ChatRemoteSource {
  ChatRemoteSource(this.firestore, this.firebaseAuth, this._ref);

  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  final Ref _ref;

  String? get userId => this.firebaseAuth.currentUser?.uid;
  // Stream<List<RoomModel>> getChatList({required bool isMerchant}) {
  //   late Stream<List<RoomModel>> response;
  //   print(userId);
  //   if (isMerchant) {
  //     final snapshot = firestore.collection(AppConstant.rooms).snapshots()
  //       ..listen((event) {
  //         print('------------  ${event.docs.first.data()} ----------------');
  //       });
  //     response = snapshot.map((event) => event.docs.map((e) => RoomModel.fromJson(e.data())).toList());
  //   } else {
  //     response = firestore.collection(AppConstant.rooms).snapshots().map((event) => event.docs.map((e) => RoomModel.fromJson(e.data())).toList());
  //   }
  //   return response;
  // }

  Future<Either<AppError, bool>> sendMessage({required MessageModel message}) async {
    try {
      String? imageUrl;
      if (message.type == MessageType.image) {
        imageUrl = await StorageHelper.uploadFile(_ref, File(message.imageUrl!), path: 'chats');
      }
      final now = DateTime.now().millisecondsSinceEpoch;
      final ref = firestore.collection(AppConstant.messages);
      ref.doc(ref.doc().id).set(message.copyWith(id: ref.doc().id, imageUrl: imageUrl, createdAt: now).toJson());
      return right(true);
    } on FirebaseAuthException catch (e) {
      return left(AppError.serverError(message: e.message ?? ''));
    }
  }

  Future<Either<AppError, String>> createChatRoom({required RoomModel room}) async {
    try {
      final ref = firestore.collection(AppConstant.rooms);
      ref.doc(ref.doc().id).set(room.copyWith(id: ref.doc().id).toJson());
      return right(ref.doc().id);
    } on FirebaseAuthException catch (e) {
      return left(AppError.serverError(message: e.message ?? 'Failed to Create Chat'));
    } on FirebaseException catch (e) {
      return left(AppError.serverError(message: e.message ?? 'Failed to Create Chat'));
    }
  }
}

final chatRemoteSourceProvider = Provider<ChatRemoteSource>((ref) {
  return ChatRemoteSource(ref.read(firestoreProvider), ref.read(firebaseAuthProvider), ref);
});

Future<CustomUserModel> getUserInfo(Ref ref, String userId) async {
  final firestore = ref.read(firestoreProvider);
  final response = await firestore.collection(AppConstant.users).doc(userId).get();
  return CustomUserModel.fromJson(response.data()!);
}

Future<CustomUserModel> getMerchantInfo(Ref ref, String merchantId) async {
  final firestore = ref.read(firestoreProvider);
  final response = await firestore.collection(AppConstant.merchants).doc(merchantId).get();
  return CustomUserModel.fromJson(response.data()!);
}

Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(Ref ref, String roomId) {
  final firestore = ref.read(firestoreProvider);
  return firestore.collection(AppConstant.messages).where('room_id', isEqualTo: roomId).orderBy('created_at', descending: true).snapshots();
}

Future<ProductModel> getProductInfo(Ref ref, String productId) async {
  final firestore = ref.read(firestoreProvider);
  final response = await firestore.collection(AppConstant.products).doc(productId).get();
  return ProductModel.fromJson(response.data()!);
}
