import 'package:firebase_storage/firebase_storage.dart';
import 'package:localfix/core/error/error_handling.dart';
import 'package:localfix/features/home/data/datasource/home_datasource.dart';
import 'package:localfix/features/home/domain/entities/search_result_entity.dart';
import 'package:localfix/features/home/domain/entities/service_category_entity.dart';
import 'package:localfix/features/home/domain/repositories/home_repo.dart';

class HomeRepositories extends HomeRepo {
  final HomeDatasource ds;
  HomeRepositories({required this.ds});
  @override
  Future<List<ServiceCategoryEntity>> getActiveServiceCategories() async {
    try {
      final result = await ds.getActiveServiceCategories();
      return result;
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Firebase server error');
    } catch (e) {
      throw ServerException('Something went wrong: $e');
    }
  }

  @override
  Future<List<SearchResultEntity>> searchCategory(String query) async {
    try {
      final result = await ds.allSearch(query);
      return result;
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? "Firebase server error");
    } catch (e) {
      throw ServerException("Something went wrong: $e");
    }
  }
}
