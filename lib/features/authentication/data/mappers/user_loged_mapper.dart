import 'package:tasks_todo/features/authentication/data/model/user_logued_model.dart';
import 'package:tasks_todo/features/authentication/domain/entity/user_loged_entity.dart';

class UserLogedMapper {
  static UserLogedEntity toEntity(UserLoguedModel model) {
    return UserLogedEntity(
      id: model.id,
      fullName: model.fullName,
      email: model.email,
      phoneNumber: model.phoneNumber,
      occupation: model.occupation,
    );
  }
}
