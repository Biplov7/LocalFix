import 'package:localfix/features/auth/domain/entities/signup_entity.dart';
import 'package:localfix/features/auth/domain/entities/user_entity.dart';
import 'package:localfix/features/auth/domain/repositories/auth_repositories.dart';

class SignupUsecase {
  final AuthRepositories repo;

  SignupUsecase(this.repo);

  Future<UserEntity> call(SignupEntity entity) {
    return repo.signUp(entity);
  }
}
