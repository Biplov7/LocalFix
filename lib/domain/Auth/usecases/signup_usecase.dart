import 'package:localfix/domain/Auth/entities/signup_entity.dart';
import 'package:localfix/domain/Auth/entities/user_entity.dart';
import 'package:localfix/domain/Auth/repositoires/auth_repositories.dart';

class SignupUsecase {
  final AuthRepositories repo;

  SignupUsecase(this.repo);

  Future<UserEntity> call(SignupEntity entity) {
    return repo.signUp(entity);
  }
}
