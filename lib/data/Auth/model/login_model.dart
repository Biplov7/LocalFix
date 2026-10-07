import 'package:localfix/domain/Auth/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required super.email,
    required super.password,
  });

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}