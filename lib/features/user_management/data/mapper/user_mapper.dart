import 'package:tasks_todo/features/user_management/data/model/user_model.dart';
import 'package:tasks_todo/features/user_management/domain/entities/user_entity.dart';

class UserMapper {
  static UserModel toModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      fullName: entity.fullName,
      email: entity.email,
      password: entity.password,
      phoneNumber: entity.phoneNumber,
      occupation: entity.occupation,
    );
  }

  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      fullName: model.fullName,
      email: model.email,
      password: model.password,
      phoneNumber: model.phoneNumber,
      occupation: model.occupation,
    );
  }
}
