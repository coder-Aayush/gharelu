import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gharelu/src/chat/data_source/chat_data_source.dart';
import 'package:gharelu/src/chat/models/message_model.dart';
import 'package:gharelu/src/core/constant/app_constant.dart';
import 'package:gharelu/src/core/extensions/list_extension.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GetMessageNotifier extends StateNotifier<AppState<List<MessageModel>>> {
  GetMessageNotifier(this._firestore, this._firebaseAuth, this.ref) : super(const AppState.initial());

  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  final Ref ref;

  void getMessages({required String roomId}) {
    state = const AppState.loading();
    List<MessageModel> messages = [];
    _firestore.collection(AppConstant.messages).where('room_id', isEqualTo: roomId).orderBy('created_at', descending: true).snapshots().listen((event) async {
      messages = List<MessageModel>.from(event.docs.map((e) => MessageModel.fromJson(e.data())));
      for (var message in messages) {
        final index = messages.indexOf(message);
        // final user = await getUserInfo(ref, message.userId);
        // final merchant = await getMerchantInfo(ref, message.merchantId);
        final _message = messages[index].copyWith();
        messages.update(index, _message);
        state = AppState.success(data: messages);
      }
      state = AppState.success(data: messages);
    });
  }
}

final getMessagesNotifierProvider = StateNotifierProvider.family<GetMessageNotifier, AppState<List<MessageModel>>, String>((ref, roomId) {
  return GetMessageNotifier(ref.read(firestoreProvider), ref.read(firebaseAuthProvider), ref)..getMessages(roomId: roomId);
});
