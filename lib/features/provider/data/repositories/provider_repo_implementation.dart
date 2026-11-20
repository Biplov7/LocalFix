import 'package:firebase_storage/firebase_storage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:localfix/core/error/error_handling.dart';
import 'package:localfix/features/provider/data/datasource/provider_datasource.dart';
import 'package:localfix/features/provider/data/model/provider_model.dart';
import 'package:localfix/features/provider/data/model/provider_service_model.dart';
import 'package:localfix/features/provider/domain/entities/provider_entity.dart';
import 'package:localfix/features/provider/domain/entities/provider_service_entity.dart';
import 'package:localfix/features/provider/domain/repositories/provider_repo.dart';

class ProviderRepositoryImplementation extends ProviderRepo {
  final ProviderDatasource pd;

  ProviderRepositoryImplementation(this.pd);
  @override
  Future<List<ProviderModel>> getAllProvider() async {
    try {
      final allProvider = await pd.getAllProvider();
      return allProvider;
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Firebase server error');
    } catch (e) {
      throw ServerException('Something went wrong: $e');
    }
  }

  @override
  Future<List<ProviderServiceModel>> getAllProviderServices(
    String providerId,
  ) async {
    try {
      return await pd.getAllProviderService(providerId);
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Firebase server error');
    } catch (e) {
      throw ServerException('Something went wrong: $e');
    }
  }

  @override
  Future<void> setProvider(
    ProviderEntity entity,
    ProviderServiceEntity serviceEntity,
  ) async {
    try {
      final providerModel = entity as ProviderModel;
      final serviceModel = serviceEntity as ProviderServiceModel;
      await pd.setAllProviderandServices(providerModel, serviceModel);
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Firebase server error');
    } catch (e) {
      throw ServerException('Something went wrong: $e');
    }
  }


}