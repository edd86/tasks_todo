import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_todo/core/constants/data_response.dart';
import 'package:tasks_todo/features/authentication/data/repo_impl/auth_repo_impl.dart';
import 'package:tasks_todo/features/authentication/domain/entity/user_loged_entity.dart';
import 'package:tasks_todo/features/authentication/domain/entity/user_login_entity.dart';
import 'package:tasks_todo/features/authentication/domain/repo/auth_repo.dart';

final authRepoProvider = Provider<AuthRepo>((ref) {
  return AuthRepoImpl();
});

final authProvider =
    NotifierProvider<AuthNotifier, DataResponse<UserLogedEntity?>>(() {
      return AuthNotifier();
    });

class AuthNotifier extends Notifier<DataResponse<UserLogedEntity?>> {
  @override
  DataResponse<UserLogedEntity?> build() {
    return DataResponse.success(null, 'Initial State');
  }

  Future<void> login(UserLoginEntity userLogin) async {
    state = DataResponse.loading();
    final repo = ref.read(authRepoProvider);
    final result = await repo.login(userLogin);
    if (result.isSuccess) {
      state = DataResponse.success(
        result.data,
        result.message ?? 'Login Successful',
      );
    } else {
      state = DataResponse.error(result.message ?? 'Login Failed');
    }
  }
}
