import 'package:localfix/features/home/domain/entities/search_result_entity.dart';
import 'package:localfix/features/home/domain/entities/service_category_entity.dart';

abstract class HomeRepositories {
  Future<List<SearchResultEntity>> searchCategory(String query);
  Future<List<ServiceCategoryEntity>> getActiveServiceCategories();
  // Future<List<ProviderEntity>> getFeaturedProviders();
  // Future<LocationEntity?> getCurrentLocation();
}
