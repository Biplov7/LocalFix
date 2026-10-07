import 'package:localfix/domain/Auth/entities/user_entity.dart';

sealed class AuthState{}

class AuthInitial extends AuthState{}

class AuthLoading extends AuthState{}

class AuthAuthenticate extends AuthState{
    final UserEntity user;

    AuthAuthenticate(this.user);
}

class AuthUnAuthenticate extends AuthState{}

class AuthPasswordChanged extends AuthState{}

class AuthFailure extends AuthState{
    final String message; 
    AuthFailure(this.message);
}