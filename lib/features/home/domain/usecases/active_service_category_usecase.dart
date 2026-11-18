import 'package:localfix/features/home/domain/entities/service_category_entity.dart';
import 'package:localfix/features/home/domain/repositories/home_repo.dart';

class ActiveServiceCategoryUsecase {
  final HomeRepo _repo;
  ActiveServiceCategoryUsecase(this._repo);

  Future<List<ServiceCategoryEntity>> call(){
    return _repo.getActiveServiceCategories();
  }
}