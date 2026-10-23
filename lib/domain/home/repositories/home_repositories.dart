import 'package:localfix/domain/home/entities/location_entity.dart';
import 'package:localfix/domain/home/entities/provider_entity.dart';
import 'package:localfix/domain/home/entities/search_result_entity.dart';
import 'package:localfix/domain/home/entities/service_category_entity.dart';

abstract class HomeRepositories {
  Future<List<SearchResultEntity>> searchCategory(String query);
  Future<List<ServiceCategoryEntity>> getActiveServiceCategories();
  Future<List<ProviderEntity>> getFeaturedProviders();
  Future<LocationEntity?> getCurrentLocation();
}