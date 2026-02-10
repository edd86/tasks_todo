import 'package:tasks_todo/features/authentication/domain/entity/user_loged_entity.dart';
import 'package:tasks_todo/features/authentication/domain/entity/user_login_entity.dart';

abstract class AuthRepo {
  Future<UserLogedEntity> login(UserLoginEntity userLogin);
}
