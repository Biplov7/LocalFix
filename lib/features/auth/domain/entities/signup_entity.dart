class SignupEntity {
  final String name;
  final String email;
  final String phone;
  final String password;

  SignupEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  SignupEntity copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
  }) {
    return SignupEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }
}