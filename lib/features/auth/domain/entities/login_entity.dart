class LoginEntity {
  final String email;
  final String password;

  LoginEntity({
    required this.email,
    required this.password,
  });

  LoginEntity copyWith({
    String? email,
    String? password,
  }) {
    return LoginEntity(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}