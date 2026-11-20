import 'package:localfix/features/provider/domain/entities/provider_entity.dart';
import 'package:localfix/features/provider/domain/entities/provider_service_entity.dart';

abstract class ProviderRepo {
  Future<List<ProviderEntity>> getAllProvider();
  Future<List<ProviderServiceEntity>> getAllProviderServices(String providerId);
  Future<void> setProvider(ProviderEntity entity, ProviderServiceEntity serviceEntity);
}