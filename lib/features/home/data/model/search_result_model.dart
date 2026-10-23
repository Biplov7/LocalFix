import 'package:localfix/features/home/data/model/service_category_model.dart';
import 'package:localfix/features/home/data/model/service_model.dart';
import 'package:localfix/features/home/domain/entities/search_result_entity.dart';

class SearchResultModel extends SearchResultEntity {
  const SearchResultModel({
    required super.id,
    required super.title,
    required super.subTitle,
    required super.imageUrl,
    required super.type,
  });

  factory SearchResultModel.fromCategory(
    ServiceCategoryModel category,
  ) {
    return SearchResultModel(
      id: category.categoryId,
      title: category.name,
      subTitle: category.name,
      imageUrl: '',
      type: SearchResultType.category,
    );
  }

  factory SearchResultModel.fromService(
    ServiceModel service,
  ) {
    return SearchResultModel(
      id: service.serviceId,
      title: service.name,
      subTitle: service.name,
      imageUrl: service.imageUrl ?? '',
      type: SearchResultType.service,
    );
  }

  // factory SearchResultModel.fromProvider(
  //   ProviderModel provider,
  // ) {
  //   return SearchResultModel(
  //     id: provider.providerUid,
  //     title: provider.name,
  //     subTitle: 'Service provider',
  //     imageUrl: provider.imageUrl ?? '',
  //     type: SearchResultType.provider,
  //   );
  // }
}