import 'package:localfix/data/Auth/datasource/auth_datasource.dart';
import 'package:localfix/data/Auth/model/login_model.dart';
import 'package:localfix/data/Auth/model/signup_model.dart';
import 'package:localfix/data/Auth/model/user_model.dart';
import 'package:localfix/domain/Auth/entities/login_entity.dart';
import 'package:localfix/domain/Auth/entities/signup_entity.dart';
import 'package:localfix/domain/Auth/entities/user_entity.dart';
import 'package:localfix/domain/Auth/repositoires/auth_repositories.dart';

class AuthRepoImplement extends AuthRepositories {
  final AuthDatasource ad;

  AuthRepoImplement(this.ad);

  @override
  Future<UserEntity?> getCurrentUser() async {
    final user = ad.getCurrentUser();
    if (user == null) {
      return null;
    }
    return UserModel(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      phone: user.phoneNumber ?? '',
    );
  }

  @override
  bool isLoggedIn(){
    try {
      final isLoged = ad.isLoggedIn();
      return isLoged;
    } catch (error) {
      throw StateError('Problem with login');
    }
  }

  @override
  Future<UserEntity> logIn(LoginEntity model) async {
    final login = LoginModel(email: model.email, password: model.password);
    final userModel = await ad.logIn(login);
    return userModel;
  }

  @override
  Future<void> signOut() {
    return ad.signOut();
  }

  @override
  Future<UserModel> signUp(SignupEntity model) async{
    final signup = SignupModel(
      name: model.name,
      email: model.email,
      phone: model.phone,
      password: model.password,
    );
    final user = await ad.signUp(signup);

    return user;

  }

  @override
  Future<void> changePassword({
    required String email,
    required String password,
    required String newPassword
  }) async{
    await ad.reAuthenticateUser(email: email, password: password);
    await ad.changePassword(newPassword: newPassword);
  }
}
