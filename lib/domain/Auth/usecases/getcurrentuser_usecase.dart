import 'package:localfix/domain/Auth/entities/user_entity.dart';
import 'package:localfix/domain/Auth/repositoires/auth_repositories.dart';

class GetcurrentuserUsecase {
  final AuthRepositories repo;

  GetcurrentuserUsecase(this.repo);


  Future<UserEntity?> call(){
    return repo.getCurrentUser();
  }
}