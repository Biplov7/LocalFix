import 'package:localfix/features/provider/domain/entities/provider_entity.dart';
import 'package:localfix/features/provider/domain/repositories/provider_repo.dart';

class GetAllProviderUsecaseService {
  final ProviderRepo _repo;
  GetAllProviderUsecaseService(this._repo);

  
  Future<List<ProviderEntity>> call(){
    return _repo.getAllProvider();
  }
}