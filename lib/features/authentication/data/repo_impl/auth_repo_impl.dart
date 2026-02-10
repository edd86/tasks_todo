import 'package:tasks_todo/features/authentication/domain/entity/user_loged_entity.dart';
import 'package:tasks_todo/features/authentication/domain/entity/user_login_entity.dart';
import 'package:tasks_todo/features/authentication/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<UserLogedEntity> login(UserLoginEntity userLogin) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
