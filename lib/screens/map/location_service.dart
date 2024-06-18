import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_background/flutter_background.dart';

class LocationService {
  final String orderId;
  late StreamSubscription<Position> _positionSubscription;

  LocationService(this.orderId);

  Future<void> start() async {
    bool hasPermissions = await _requestPermissions();
    if (!hasPermissions) return;

    const androidConfig = FlutterBackgroundAndroidConfig(
      notificationTitle: 'Background Location Service',
      notificationText: 'Your location is being tracked in the background',
      notificationImportance: AndroidNotificationImportance.Default,
      // notificationIcon: 'ic_launcher', // Use the name without creating AndroidResource
    );

    bool success = await FlutterBackground.initialize(androidConfig: androidConfig);
    if (success) {
      FlutterBackground.enableBackgroundExecution();
      _positionSubscription = Geolocator.getPositionStream(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      ).listen((Position position) {
        _updateLocation(position);
      });
    }
  }

  Future<bool> _requestPermissions() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission == LocationPermission.always;
  }

  Future<void> _updateLocation(Position position) async {
    try {
      await FirebaseFirestore.instance.collection('orders').doc(orderId).update({
        'latitude': position.latitude,
        'longitude': position.longitude,
      });
    } catch (e) {
      print('Error updating Firestore location: $e');
    }
  }

  void stop() {
    _positionSubscription.cancel();
    FlutterBackground.disableBackgroundExecution();
  }
}
