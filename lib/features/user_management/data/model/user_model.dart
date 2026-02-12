import 'package:bcrypt/bcrypt.dart';

class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String password;
  final String? phoneNumber;
  final String? occupation;

  const UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    this.phoneNumber,
    this.occupation,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phone_number'],
      occupation: json['occupation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'password': hashPassword(password),
      'phone_number': phoneNumber,
      'occupation': occupation,
    };
  }

  UserModel copyWith({
    int? id,
    String? fullName,
    String? email,
    String? password,
    String? phoneNumber,
    String? occupation,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? hashPassword(password!),
      phoneNumber: phoneNumber ?? this.phoneNumber,
      occupation: occupation ?? this.occupation,
    );
  }

  String hashPassword(String password) {
    return BCrypt.hashpw(password, BCrypt.gensalt());
  }
}

/* final String hashed = BCrypt.hashpw('password', BCrypt.gensalt());
// $2a$10$r6huirn1laq6UXBVu6ga9.sHca6sr6tQl3Tiq9LB6/6LMpR37XEGu

final bool checkPassword = BCrypt.checkpw('password', hashed);
// true */
