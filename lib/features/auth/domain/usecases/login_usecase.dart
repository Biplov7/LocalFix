import 'package:localfix/features/auth/domain/entities/login_entity.dart';
import 'package:localfix/features/auth/domain/entities/user_entity.dart';
import 'package:localfix/features/auth/domain/repositories/auth_repositories.dart';

class LoginUsecase {
  final AuthRepositories repo;

  LoginUsecase(this.repo);

  Future<UserEntity> call(LoginEntity entity) {
    return repo.logIn(entity);
  }
}
