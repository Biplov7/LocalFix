import 'package:localfix/features/auth/domain/repositories/auth_repositories.dart';

class IsloggedinUsecase {
  final AuthRepositories repo;

  IsloggedinUsecase(this.repo);

  bool call(){
    return repo.isLoggedIn();
  }
}
