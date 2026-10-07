import 'package:localfix/domain/Auth/entities/login_entity.dart';
import 'package:localfix/domain/Auth/entities/signup_entity.dart';

sealed class AuthEvent {}

class LoginAuthSubmitted extends AuthEvent {
  final LoginEntity login;
  LoginAuthSubmitted(this.login);
}

class SignupAuthSubmitted extends AuthEvent {
  final SignupEntity signup;

  SignupAuthSubmitted(this.signup);
}

class CheckAuth extends AuthEvent {}

class SignOutSubmitted extends AuthEvent {}

class ChangePasswordRequest extends AuthEvent {
  final String email;
  final String currentPassword;
  final String newPassword;

  ChangePasswordRequest({
    required this.email,
    required,
    required this.currentPassword,
    required this.newPassword,
  });
}
