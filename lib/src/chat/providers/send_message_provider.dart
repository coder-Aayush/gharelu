import 'package:gharelu/src/chat/data_source/chat_data_source.dart';
import 'package:gharelu/src/chat/models/message_model.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SendMessageNotifier extends StateNotifier<AppState<bool>> {
  SendMessageNotifier(this._remoteSource) : super(const AppState.initial());
  final ChatRemoteSource _remoteSource;
  Future sendMessage({required MessageModel message}) async {
    state = const AppState.loading();
    final response = await _remoteSource.sendMessage(message: message);
    state = response.fold(
      (error) => error.when(
          serverError: (message) => AppState.error(message: message),
          noInternet: () => AppState.noInternet()),
      (response) => AppState.success(data: response),
    );
  }
}

final sendMessageNotifierProvider =
    StateNotifierProvider<SendMessageNotifier, AppState<bool>>((ref) {
  return SendMessageNotifier(ref.read(chatRemoteSourceProvider));
});
