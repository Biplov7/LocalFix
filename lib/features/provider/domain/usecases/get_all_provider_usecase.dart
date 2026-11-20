import 'package:localfix/features/provider/domain/entities/provider_service_entity.dart';
import 'package:localfix/features/provider/domain/repositories/provider_repo.dart';

class GetAllProviderUsecase {
  final ProviderRepo _repo;
  GetAllProviderUsecase(this._repo);

  Future<List<ProviderServiceEntity>> call(String providerId){
    return _repo.getAllProviderServices(providerId);
  }
}