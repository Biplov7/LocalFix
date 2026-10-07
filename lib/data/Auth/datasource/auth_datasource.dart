import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:localfix/data/Auth/model/login_model.dart';
import 'package:localfix/data/Auth/model/signup_model.dart';
import 'package:localfix/data/Auth/model/user_model.dart';

class AuthDatasource {
  final FirebaseAuth auth;
  AuthDatasource(this.auth);

  Future<UserModel> signUp(SignupModel model) async {
    final credentail = await auth.createUserWithEmailAndPassword(
      email: model.email,
      password: model.password,
    );
    final user = credentail.user;

    if (user == null) {
      throw StateError("Signup Failed: No user is created");
    }

    return UserModel(
      id: user.uid,
      name: model.name,
      email: user.email ?? '',
      phone: model.phone,
    );
  }

  Future<UserModel> logIn(LoginModel model) async {
    final credential = await auth.signInWithEmailAndPassword(
      email: model.email,
      password: model.password,
    );

    final user = credential.user;

    if (user == null) {
      throw StateError("Login Failed: No user is created");
    }

    return UserModel(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      phone: user.phoneNumber ?? '',
    );
  }

  Future signOut() async {
    return await auth.signOut();
  }

  User? getCurrentUser() {
    return auth.currentUser;
  }

  bool isLoggedIn() {
    final userName = auth.currentUser;

    if (userName == null) {
      return false;
    }
    return true;
  }

  // Future reAuthenticate user like for changing email/password/or username.
  Future<void> reAuthenticateUser({
    required String email,
    required String password,
  }) async {
    final user = auth.currentUser;
    if (user == null) {
      throw StateError('No user is signed in');
    }

    final credentials = EmailAuthProvider.credential(
      email: email,
      password: password,
    );

    await user.reauthenticateWithCredential(credentials);
  }

  //Future change password
  Future changePassword({
    required String newPassword
  }) async{
    final user = auth.currentUser;
    if(user == null){
      throw StateError("No user is signed in");
    }
    await user.updatePassword(newPassword);
    
  }
}
