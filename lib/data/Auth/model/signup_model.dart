import 'package:localfix/domain/Auth/entities/signup_entity.dart';

class SignupModel extends SignupEntity {
  SignupModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.password,
  });

  factory SignupModel.fromMap(Map<String, dynamic> map) {
    return SignupModel(
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      password: map['password'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }
}