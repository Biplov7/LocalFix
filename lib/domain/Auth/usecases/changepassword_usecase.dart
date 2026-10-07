import 'package:localfix/domain/Auth/repositoires/auth_repositories.dart';

class ChangepasswordUsecase {
  final AuthRepositories repo;
  ChangepasswordUsecase(this.repo);

  Future<void> call({
    required String email,
    required String password,
    required String newPassword,
  }) {
    return repo.changePassword(
      email: email,
      password: password,
      newPassword: newPassword,
    );
  }
}
