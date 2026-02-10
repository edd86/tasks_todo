import 'package:bcrypt/bcrypt.dart';

class UserLoginModel {
  final String email;
  final String password;

  const UserLoginModel({required this.email, required this.password});

  bool checkPassword(String password) {
    return BCrypt.checkpw(this.password, password);
  }
}
