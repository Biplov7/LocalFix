import 'package:localfix/features/auth/domain/entities/user_entity.dart';
import 'package:localfix/features/auth/domain/repositories/auth_repositories.dart';

class GetcurrentuserUsecase {
  final AuthRepositories repo;

  GetcurrentuserUsecase(this.repo);


  Future<UserEntity?> call(){
    return repo.getCurrentUser();
  }
}
