import 'package:gharelu/src/app/data_source/auth_status_data_source.dart';
import 'package:gharelu/src/auth/models/custom_user_model.dart';
import 'package:gharelu/src/core/providers/firbease_provider.dart';
import 'package:gharelu/src/core/state/app_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthStatusNotifier extends StateNotifier<AppState<CustomUserModel>> {
  AuthStatusNotifier(this._dataSource) : super(const AppState.initial());
  final AuthStatusDataSource _dataSource;

  Future<void> checkAuth({required String id}) async {
    state = const AppState.loading();
    final response = await _dataSource.authSatus(id: id);
    state = response.fold(
      (error) => error.when(
          serverError: (message) => AppState.error(message: message),
          noInternet: () => const AppState.noInternet()),
      (response) => AppState.success(data: response),
    );
  }
}

final authStatusNotifierProvider = StateNotifierProvider.autoDispose<
    AuthStatusNotifier, AppState<CustomUserModel>>((ref) {
  final currentUser = ref.read(firebaseAuthProvider).currentUser;
  final notifier = AuthStatusNotifier(ref.read(authStatusDataSourceProvider));
  if (currentUser != null) {
    notifier..checkAuth(id: currentUser.uid);
  }
  return notifier;
});
