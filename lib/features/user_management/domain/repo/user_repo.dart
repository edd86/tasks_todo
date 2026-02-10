import 'package:tasks_todo/features/user_management/domain/entities/user_entity.dart';

abstract class UserRepo {
  Future<UserEntity> registerUser(UserEntity user);
}
