import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:localfix/features/auth/data/datasource/auth_datasource.dart';
import 'package:localfix/features/auth/data/repositories/auth_repo_implement.dart';
import 'package:localfix/features/auth/domain/repositories/auth_repositories.dart';
import 'package:localfix/features/auth/domain/usecases/changepassword_usecase.dart';
import 'package:localfix/features/auth/domain/usecases/getcurrentuser_usecase.dart';
import 'package:localfix/features/auth/domain/usecases/isloggedin_usecase.dart';
import 'package:localfix/features/auth/domain/usecases/login_usecase.dart';
import 'package:localfix/features/auth/domain/usecases/signout_usecase.dart';
import 'package:localfix/features/auth/domain/usecases/signup_usecase.dart';
import 'package:localfix/features/auth/presentation/bloc/auth_bloc.dart';

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
