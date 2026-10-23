import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localfix/features/auth/domain/usecases/changepassword_usecase.dart';
import 'package:localfix/features/auth/domain/usecases/getcurrentuser_usecase.dart';
import 'package:localfix/features/auth/domain/usecases/isloggedin_usecase.dart';
import 'package:localfix/features/auth/domain/usecases/login_usecase.dart';
import 'package:localfix/features/auth/domain/usecases/signout_usecase.dart';
import 'package:localfix/features/auth/domain/usecases/signup_usecase.dart';
import 'package:localfix/features/auth/presentation/bloc/auth_event.dart';
import 'package:localfix/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetcurrentuserUsecase getcurrentuserUsecase;
  final IsloggedinUsecase isloggedinUsecase;
  final LoginUsecase loginUsecase;
  final SignoutUsecase signoutUsecase;
  final SignupUsecase signupUsecase;
  final ChangepasswordUsecase changepasswordUsecase;
  AuthBloc({
    required this.getcurrentuserUsecase,
    required this.isloggedinUsecase,
    required this.loginUsecase,
    required this.signoutUsecase,
    required this.signupUsecase,
    required this.changepasswordUsecase,
  }) : super(AuthInitial()) {
    on<LoginAuthSubmitted>(_loginAuthSubmitted);
    on<SignupAuthSubmitted>(_signupAuthSubmitted);
    on<CheckAuth>(_checkAuth);
    on<SignOutSubmitted>(_signOutSubmitted);
    on<ChangePasswordRequest>(_changePassword);
  }

  Future<void> _loginAuthSubmitted(
    LoginAuthSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      final user = await loginUsecase(event.login);
      emit(AuthAuthenticate(user));
    } catch (e) {
      emit(AuthFailure("Something went wring ${e.toString()}"));
    }
  }

  Future<void> _signupAuthSubmitted(
    SignupAuthSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      final user = await signupUsecase(event.signup);
      emit(AuthAuthenticate(user));
    } catch (e) {
      emit(AuthFailure("Something went wring ${e.toString()}"));
    }
  }

  Future<void> _checkAuth(CheckAuth event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      final isLogin = isloggedinUsecase();
      if (!isLogin) {
        emit(AuthUnAuthenticate());
        return;
      }
      final user = await getcurrentuserUsecase();

      if (user != null) {
        emit(AuthAuthenticate(user));
      } else {
        emit(AuthUnAuthenticate());
      }
    } catch (e) {
      emit(AuthFailure("Something went wring ${e.toString()}"));
    }
  }

  Future<void> _signOutSubmitted(
    SignOutSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      await signoutUsecase();
      emit(AuthUnAuthenticate());
    } catch (e) {
      emit(AuthFailure("Cannot sign out user ${e.toString()}"));
    }
  }

  Future<void> _changePassword(
    ChangePasswordRequest event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      await changepasswordUsecase(
        email: event.email,
        password: event.currentPassword,
        newPassword: event.newPassword,
      );
      emit(AuthPasswordChanged());
    } catch (e) {
      emit(AuthFailure("Cannot change password ${e.toString()}"));
    }
  }
}
