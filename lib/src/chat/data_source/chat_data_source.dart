import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
***REMOVED***
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gharelu/src/auth/models/custom_user_model.dart';
import 'package:gharelu/src/chat/models/message_model.dart';
import 'package:gharelu/src/chat/models/room_model.dart';
import 'package:gharelu/src/core/constant/app_constant.dart';
***REMOVED***
import 'package:gharelu/src/core/extensions/list_extension.dart';
import 'package:gharelu/src/core/helpers/storage_helper.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../home/models/product_model.dart';

class ChatRemoteSource ***REMOVED***
  ChatRemoteSource(this.firestore, this.firebaseAuth, this._ref);

  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  final Ref _ref;

  String? get userId => this.firebaseAuth.currentUser?.uid;
  // Stream<List<RoomModel>> getChatList(***REMOVED***required bool isMerchant***REMOVED***) ***REMOVED***
  //   late Stream<List<RoomModel>> response;
  //   print(userId);
  //   if (isMerchant) ***REMOVED***
  //     final snapshot = firestore.collection(AppConstant.rooms).snapshots()
  //       ..listen((event) ***REMOVED***
  //         print('------------  $***REMOVED***event.docs.first.data()***REMOVED*** ----------------');
  //     ***REMOVED***
  //     response = snapshot.map((event) => event.docs.map((e) => RoomModel.fromJson(e.data())).toList());
  //   ***REMOVED*** else ***REMOVED***
  //     response = firestore.collection(AppConstant.rooms).snapshots().map((event) => event.docs.map((e) => RoomModel.fromJson(e.data())).toList());
  //   ***REMOVED***
  //   return response;
  // ***REMOVED***

  Future<Either<AppError, bool>> sendMessage(***REMOVED***required MessageModel message***REMOVED***) async ***REMOVED***
***REMOVED***
      String? imageUrl;
      if (message.type == MessageType.image) ***REMOVED***
        imageUrl = await StorageHelper.uploadFile(_ref, File(message.imageUrl!), path: 'chats');
      ***REMOVED***
      final now = DateTime.now().millisecondsSinceEpoch;
      final ref = firestore.collection(AppConstant.messages);
      ref.doc(ref.doc().id).set(message.copyWith(id: ref.doc().id, imageUrl: imageUrl, createdAt: now).toJson());
      return right(true);
    ***REMOVED*** on FirebaseAuthException catch (e) ***REMOVED***
      return left(AppError.serverError(message: e.message ?? ''));
    ***REMOVED***
  ***REMOVED***

  Future<Either<AppError, String>> createChatRoom(***REMOVED***required RoomModel room***REMOVED***) async ***REMOVED***
***REMOVED***
      final ref = firestore.collection(AppConstant.rooms);
      ref.doc(ref.doc().id).set(room.copyWith(id: ref.doc().id).toJson());
      return right(ref.doc().id);
    ***REMOVED*** on FirebaseAuthException catch (e) ***REMOVED***
      return left(AppError.serverError(message: e.message ?? 'Failed to Create Chat'));
    ***REMOVED*** on FirebaseException catch (e) ***REMOVED***
      return left(AppError.serverError(message: e.message ?? 'Failed to Create Chat'));
    ***REMOVED***
  ***REMOVED***
***REMOVED***

final chatRemoteSourceProvider = Provider<ChatRemoteSource>((ref) ***REMOVED***
  return ChatRemoteSource(ref.read(firestoreProvider), ref.read(firebaseAuthProvider), ref);
***REMOVED***);

Future<CustomUserModel> getUserInfo(Ref ref, String userId) async ***REMOVED***
  final firestore = ref.read(firestoreProvider);
  final response = await firestore.collection(AppConstant.users).doc(userId).get();
  return CustomUserModel.fromJson(response.data()!);
***REMOVED***

Future<CustomUserModel> getMerchantInfo(Ref ref, String merchantId) async ***REMOVED***
  final firestore = ref.read(firestoreProvider);
  final response = await firestore.collection(AppConstant.merchants).doc(merchantId).get();
  return CustomUserModel.fromJson(response.data()!);
***REMOVED***

Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(Ref ref, String roomId) ***REMOVED***
  final firestore = ref.read(firestoreProvider);
  return firestore.collection(AppConstant.messages).where('room_id', isEqualTo: roomId).orderBy('created_at', descending: true).snapshots();
***REMOVED***

Future<ProductModel> getProductInfo(Ref ref, String productId) async ***REMOVED***
  final firestore = ref.read(firestoreProvider);
  final response = await firestore.collection(AppConstant.products).doc(productId).get();
  return ProductModel.fromJson(response.data()!);
***REMOVED***
