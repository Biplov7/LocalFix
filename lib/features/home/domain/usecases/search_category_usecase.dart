import 'package:localfix/features/home/domain/entities/search_result_entity.dart';
import 'package:localfix/features/home/domain/repositories/home_repo.dart';

class SearchcategoryUsecase {
  final HomeRepo repo;
  SearchcategoryUsecase(this.repo);

  Future<List<SearchResultEntity>> call(String query){
    return repo.searchCategory(query);
  }  
}