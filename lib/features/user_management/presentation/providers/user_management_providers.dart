import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks_todo/core/constants/data_response.dart';
import 'package:tasks_todo/features/user_management/data/repo_impl/user_repo_impl.dart';
import 'package:tasks_todo/features/user_management/domain/entities/user_entity.dart';

class UserRegistrationNotifier extends AsyncNotifier<DataResponse<UserEntity>> {
  @override
  Future<DataResponse<UserEntity>> build() async {
    return DataResponse.loading();
  }

  Future<void> registerUser(UserEntity user) async {
    state = const AsyncValue.loading();
    try {
      final repo = UserRepoImpl();
      final result = await repo.registerUser(user);
      if (result.isSuccess) {
        state = AsyncValue.data(result);
      } else {
        state = AsyncValue.error(result.message!, StackTrace.current);
      }
    } catch (e, st) {
      state = AsyncValue.error(e.toString(), st);
    }
  }
}

final userRegistrationProvider =
    AsyncNotifierProvider<UserRegistrationNotifier, DataResponse<UserEntity>>(
      UserRegistrationNotifier.new,
    );
