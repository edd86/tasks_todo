import 'package:tasks_todo/core/constants/data_response.dart';
import 'package:tasks_todo/features/authentication/domain/entity/user_loged_entity.dart';
import 'package:tasks_todo/features/authentication/domain/entity/user_login_entity.dart';

abstract class AuthRepo {
  Future<DataResponse<UserLogedEntity>> login(UserLoginEntity userLogin);
}
