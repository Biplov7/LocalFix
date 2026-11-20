import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:localfix/core/error/error_handling.dart';
import 'package:localfix/features/location/data/location_model.dart';

class LocationDatasource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  LocationDatasource(this.firestore, this.firebaseAuth);

  String get user {
    final uid = firebaseAuth.currentUser?.uid;
    if (uid == null) {
      throw AuthException("User is not authenticated");
    }
    return uid;
  }

  CollectionReference<Map<String, dynamic>> get location {
    return firestore.collection('user').doc(user).collection('location');
  }

  // Get the current location of the user.
  Future<Position> getCurrentCustomerPosition() async {
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Location Service are dissable');
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Future.error("Location permission is still denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationException(
        "Location permission is denied forever.We cannot access the location",
      );
    }

    final locationCoordinate = await Geolocator.getCurrentPosition();
    final customerLocation = LocationModel(
      latitude: locationCoordinate.latitude,
      longitude: locationCoordinate.longitude,
    );
    await location
        .doc('current')
        .set(customerLocation.toMap(), SetOptions(merge: true));
    return locationCoordinate;
  }
}
