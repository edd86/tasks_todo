import 'package:tasks_todo/features/user_management/domain/entities/user_entity.dart';

class UserLogedEntity extends UserEntity {
  const UserLogedEntity({
    required super.id,
    required super.fullName,
    required super.email,
    required super.phoneNumber,
    required super.occupation,
  }) : super(password: '');
}
