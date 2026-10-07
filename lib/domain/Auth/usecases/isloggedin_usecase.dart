import 'package:localfix/domain/Auth/repositoires/auth_repositories.dart';

class IsloggedinUsecase {
  final AuthRepositories repo;

  IsloggedinUsecase(this.repo);

  bool call(){
    return repo.isLoggedIn();
  }
}