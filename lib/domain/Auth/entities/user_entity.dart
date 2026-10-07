class UserEntity {
  final String id;
  final String name;
  final String email;
  final String phone;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}