import 'package:bcrypt/bcrypt.dart';
import 'package:tasks_todo/features/user_management/data/model/user_model.dart';

class UserLoguedModel extends UserModel {
  const UserLoguedModel({
    required super.id,
    required super.fullName,
    required super.email,
    required super.phoneNumber,
    required super.occupation,
    required super.password,
  });

  factory UserLoguedModel.fromJson(Map<String, dynamic> json) {
    return UserLoguedModel(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      occupation: json['occupation'],
      password: json['password'],
    );
  }

  bool checkPassword(String password) {
    return BCrypt.checkpw(password, this.password);
  }
}
