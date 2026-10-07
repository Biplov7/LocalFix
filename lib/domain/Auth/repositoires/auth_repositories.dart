import 'package:localfix/domain/Auth/entities/login_entity.dart';
import 'package:localfix/domain/Auth/entities/signup_entity.dart';
import 'package:localfix/domain/Auth/entities/user_entity.dart';

abstract class AuthRepositories {
  Future<UserEntity> signUp(SignupEntity entity);
  Future<UserEntity> logIn(LoginEntity entity);
  bool isLoggedIn();
  Future<UserEntity?> getCurrentUser();
  Future<void> signOut();
  Future<void> changePassword({
    required String email,
    required String password,
    required String newPassword,
  });
}
