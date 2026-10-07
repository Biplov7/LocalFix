import 'package:localfix/domain/Auth/entities/login_entity.dart';
import 'package:localfix/domain/Auth/entities/user_entity.dart';
import 'package:localfix/domain/Auth/repositoires/auth_repositories.dart';

class LoginUsecase {
  final AuthRepositories repo;

  LoginUsecase(this.repo);

  Future<UserEntity> call(LoginEntity entity) {
    return repo.logIn(entity);
  }
}
