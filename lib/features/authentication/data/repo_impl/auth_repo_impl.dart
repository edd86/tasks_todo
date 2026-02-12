import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tasks_todo/core/constants/data_response.dart';
import 'package:tasks_todo/features/authentication/data/mappers/user_loged_mapper.dart';
import 'package:tasks_todo/features/authentication/data/model/user_logued_model.dart';
import 'package:tasks_todo/features/authentication/domain/entity/user_loged_entity.dart';
import 'package:tasks_todo/features/authentication/domain/entity/user_login_entity.dart';
import 'package:tasks_todo/features/authentication/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<DataResponse<UserLogedEntity>> login(UserLoginEntity userLogin) async {
    final supabase = Supabase.instance.client;
    try {
      final emailRes = await supabase
          .from('users')
          .select()
          .eq('email', userLogin.email);
      if (emailRes.isEmpty) {
        return DataResponse.error('User not found');
      }
      final user = UserLoguedModel.fromJson(emailRes.first);
      if (!user.checkPassword(userLogin.password)) {
        return DataResponse.error('Invalid password');
      }
      return DataResponse.success(
        UserLogedMapper.toEntity(user),
        'User logged in successfully',
      );
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }
}
