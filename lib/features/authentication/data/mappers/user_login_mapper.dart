import 'package:tasks_todo/features/authentication/data/model/user_login_model.dart';
import 'package:tasks_todo/features/authentication/domain/entity/user_login_entity.dart';

class UserLoginMapper {
  static UserLoginModel toModel(UserLoginEntity entity) {
    return UserLoginModel(email: entity.email, password: entity.password);
  }

  static UserLoginEntity toEntity(UserLoginModel model) {
    return UserLoginEntity(email: model.email, password: model.password);
  }
}
