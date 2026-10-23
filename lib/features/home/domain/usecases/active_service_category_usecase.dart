import 'package:localfix/features/home/domain/entities/service_category_entity.dart';
import 'package:localfix/features/home/domain/repositories/home_repositories.dart';

class ActiveServiceCategoryUsecase {
  final HomeRepositories repo;
  ActiveServiceCategoryUsecase(this.repo);

  Future<List<ServiceCategoryEntity>> call(){
    return repo.getActiveServiceCategories();
  }
}