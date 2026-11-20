import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:localfix/core/error/error_handling.dart';
import 'package:localfix/features/provider/data/model/provider_model.dart';
import 'package:localfix/features/provider/data/model/provider_service_model.dart';

class ProviderDatasource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  ProviderDatasource(this.firestore, this.firebaseAuth);

  CollectionReference<Map<String, dynamic>> get provider {
    return firestore.collection('provider');
  }

  CollectionReference<Map<String, dynamic>> get providerService {
    return firestore.collection('provider_service');
  }

  String get currentUid {
    final uid = firebaseAuth.currentUser?.uid;

    if (uid == null) {
      throw StateError("User is not authenticated");
    }

    return uid;
  }

      // Get the location of the provider throught his address.
  Future<Location?> getCoordinateFromAddress(String address) async {
    try {
      final Geocoding geocoding = Geocoding();
      final location = await geocoding.locationFromAddress(address);

      if (location.isEmpty) return null;

      return location.first;
    } catch (e) {
      throw NetworkException("Network Unavailable: ${e.toString}");
    }
  }

  Future<List<ProviderModel>> getAllProvider() async {
    final result = await provider
        .where('isAvailable', isEqualTo: true)
        .get();

    return result.docs.map((provider) {
      return ProviderModel.fromMap({
        ...provider.data(),
        'providerId': provider.id,
      });
    }).toList();
  }

  Future<void> setAllProviderandServices(
    ProviderModel model,
    ProviderServiceModel service,
  ) async {
    final batch = firestore.batch();
    final uid = currentUid;
    final docRef = provider.doc(uid);
    final serviceRef = providerService.doc();
    final location = model.location;
    final address = '${location?.country},${location?.district}, ${location?.city}, ${location?.address}';
    final coordinate = await getCoordinateFromAddress(address);

    batch.set(docRef, model.toMap());
    batch.set(serviceRef, service.toMap());
    await batch.commit();
  }

  Future<List<ProviderServiceModel>> getAllProviderService(
    String providerId,
  ) async {
    final result = await providerService
        .where('providerUid', isEqualTo: providerId)
        .where('isActive', isEqualTo: true)
        .get();


    return result.docs.map((service) {
      return ProviderServiceModel.fromMap({
        ...service.data(),
        'serviceId': service.id,
      });
    }).toList();
  }
}