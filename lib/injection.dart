import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:localfix/data/Auth/datasource/auth_datasource.dart';
import 'package:localfix/data/Auth/repositories/auth_repo_implement.dart';
import 'package:localfix/domain/Auth/repositoires/auth_repositories.dart';
import 'package:localfix/domain/Auth/usecases/changepassword_usecase.dart';
import 'package:localfix/domain/Auth/usecases/getcurrentuser_usecase.dart';
import 'package:localfix/domain/Auth/usecases/isloggedin_usecase.dart';
import 'package:localfix/domain/Auth/usecases/login_usecase.dart';
import 'package:localfix/domain/Auth/usecases/signout_usecase.dart';
import 'package:localfix/domain/Auth/usecases/signup_usecase.dart';
import 'package:localfix/presentation/auth/bloc/auth_bloc.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  sl.registerLazySingleton(
    () => AuthDatasource(sl<FirebaseAuth>(), sl<FirebaseFirestore>()),
  );
  sl.registerLazySingleton<AuthRepositories>(
    () => AuthRepoImplement(sl(), sl<FirebaseFirestore>()),
  );

  sl.registerLazySingleton(() => ChangepasswordUsecase(sl()));
  sl.registerLazySingleton(() => GetcurrentuserUsecase(sl()));
  sl.registerLazySingleton(() => IsloggedinUsecase(sl()));
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => SignoutUsecase(sl()));
  sl.registerLazySingleton(() => SignupUsecase(sl()));

  sl.registerFactory(
    () => AuthBloc(
      getcurrentuserUsecase: sl(),
      isloggedinUsecase: sl(),
      loginUsecase: sl(),
      signoutUsecase: sl(),
      signupUsecase: sl(),
      changepasswordUsecase: sl(),
    ),
  );
}
