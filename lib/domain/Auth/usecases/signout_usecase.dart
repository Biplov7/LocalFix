import 'package:localfix/domain/Auth/repositoires/auth_repositories.dart';

class SignoutUsecase {
  final AuthRepositories repo;
  SignoutUsecase(this.repo);

  Future<void> call() {
    return repo.signOut();
  }
}
