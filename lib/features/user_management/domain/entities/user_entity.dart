class UserEntity {
  final int id;
  final String fullName;
  final String email;
  final String password;
  final String? phoneNumber;
  final String? occupation;

  const UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    this.phoneNumber,
    this.occupation,
  });
}
