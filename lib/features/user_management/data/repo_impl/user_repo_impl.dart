import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tasks_todo/features/user_management/data/mapper/user_mapper.dart';
import 'package:tasks_todo/features/user_management/data/model/user_model.dart';
import 'package:tasks_todo/features/user_management/domain/entities/user_entity.dart';
import 'package:tasks_todo/features/user_management/domain/repo/user_repo.dart';
import 'package:tasks_todo/core/constants/data_response.dart';

class UserRepoImpl implements UserRepo {
  @override
  Future<DataResponse<UserEntity>> registerUser(UserEntity user) async {
    final supabase = Supabase.instance.client;
    final userData = UserMapper.toModel(user).toJson();

    try {
      if (user.id == 0) {
        userData.remove('id');
      }
      final response = await supabase.from('users').insert(userData).select();
      return DataResponse.success(
        UserMapper.toEntity(UserModel.fromJson(response.last)),
        'User added succesfully',
      );
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }
}
