enum UserRole {
  patient,
  doctor,
  admin,
}

class UserEntity {
  final String id;
  final String fullName;
  final String email;
  final UserRole role;
  final String? phone;
  final String? avatarUrl;

  const UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.role,
    this.phone,
    this.avatarUrl,
  });
}
