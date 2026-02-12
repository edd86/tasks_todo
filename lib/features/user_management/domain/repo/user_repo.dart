import 'package:tasks_todo/core/constants/data_response.dart';
import 'package:tasks_todo/features/user_management/domain/entities/user_entity.dart';

abstract class UserRepo {
  Future<DataResponse<UserEntity>> registerUser(UserEntity user);
}
