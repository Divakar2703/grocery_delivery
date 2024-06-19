import 'dart:async';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';
import '../../constants.dart';

class FoodDeliveryTracking extends StatefulWidget {
  final double sourceLat;
  final double sourceLong;
  final double destiLat;
  final double destiLong;
  final String orderId;
  final String userContactNo;

  const FoodDeliveryTracking(
      {Key? key,
        required this.sourceLat,
        required this.sourceLong,
        required this.destiLat,
        required this.destiLong,
        required this.orderId,
        required this.userContactNo})
      : super(key: key);

  @override
  State<FoodDeliveryTracking> createState() => _FoodDeliveryTrackingState();
}

class _FoodDeliveryTrackingState extends State<FoodDeliveryTracking> {
  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  late TextEditingController searchAddressController;
  late Set<Marker> markers = {};
  late Set<Polyline> polylines = {};
  bool _loading = false;
  LatLng? _sourceLocation;
  LatLng? _destinationLocation;
  late StreamSubscription<Position> _positionStreamSubscription;
  double _lastBearing = 0.0;
  bool _isNavigationStarted = false;
  BitmapDescriptor locationIcon = BitmapDescriptor.defaultMarker;
  late StreamSubscription<GyroscopeEvent> _gyroscopeSubscription;
  List<LatLng> polylineCoordinates = [];
  double _distance = 0.0;
  double _estimatedTime = 0.0;
  double _heading = 0.0;
  StreamSubscription<MagnetometerEvent>? _magnetometerSubscription;

  @override
  void initState() {
    super.initState();
    print("delivery boy location ====================================================${widget.destiLat},,,,, ${widget.destiLong}");
    searchAddressController = TextEditingController();
    setCustommarkerIcon();
    _getCurrentLocation();
    _startLocationUpdates();
    _listenToDeviceOrientation();
  }

  @override
  void dispose() {
    _positionStreamSubscription.cancel();
    _gyroscopeSubscription.cancel();
    _magnetometerSubscription?.cancel();
    super.dispose();
  }
  void setCustommarkerIcon() {
    ImageConfiguration configuration = const ImageConfiguration(size: Size(24, 24));
    BitmapDescriptor.fromAssetImage(configuration, 'assets/dman.png')
        .then((icon) {
      locationIcon = icon;
    });
  }

  void _getCurrentLocation() async {
    setState(() {
      _loading = true;
    });

    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        setState(() {
          _loading = false;
        });
        return;
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _sourceLocation = LatLng(position.latitude, position.longitude);
        markers.add(_buildMarker('Current Location', _sourceLocation!));
        _moveCameraToCurrentLocation(position.latitude, position.longitude);

        _destinationLocation = LatLng(widget.destiLat, widget.destiLong);
        if (_sourceLocation != null) {
          markers.removeWhere(
                  (marker) => marker.markerId.value == 'Destination Location');
          markers.add(
              _buildMarkerDestination('Destination Location', _destinationLocation!));
          markers.add(_buildMarker('Current Location', _sourceLocation!));
          _getPolyline();
        }
        _loading = false;
      });

      // Update Firestore with initial location
      updateFirestoreLocation(position.latitude, position.longitude);
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  Marker _buildMarker(String markerId, LatLng position) {
    return Marker(
      markerId: MarkerId(markerId),
      position: position,
      infoWindow: InfoWindow(title: markerId),
      icon: locationIcon,
      rotation: _heading,
    );
  }

  void _startLocationUpdates() {
    _positionStreamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
          double bearing = _calculateBearing(_sourceLocation!.latitude,
              _sourceLocation!.longitude, position.latitude, position.longitude);
          setState(() {
            updateFirestoreLocation(position.latitude, position.longitude);
            _sourceLocation = LatLng(position.latitude, position.longitude);
            markers.add(_buildMarker('Current Location', _sourceLocation!));
            _lastBearing = bearing;
          });

          _getPolyline(); // Update polyline on location change if navigation started

          if (polylineCoordinates.isNotEmpty) {
            rotateMap();
          }
        });
  }

  double _calculateBearing(double startLatitude, double startLongitude,
      double endLatitude, double endLongitude) {
    double theta =
    math.atan2(endLongitude - startLongitude, endLatitude - startLatitude);
    double bearing = (theta * (180 / math.pi) + 360) % 360;
    return bearing;
  }

  void _moveCameraToCurrentLocation(double latitude, double longitude) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(latitude, longitude),
        17,
      ),
    );
    markers.add(_buildMarker('Current Location', _sourceLocation!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
                initialCameraPosition: _sourceLocation != null
                    ? CameraPosition(target: _sourceLocation!, zoom: 17)
                    : const CameraPosition(
                  target: LatLng(0, 0),
                  zoom: 2,
                ),
                mapType: MapType.normal,
                markers: markers,
                polylines: polylines,
                onTap: _onMapTapped,
                onMapCreated: _onMapCreated),
            if (_loading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Distance: ${_distance.toStringAsFixed(2)} km',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Estimated Time: ${_estimatedTime.toStringAsFixed(2)} mins',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: _startNavigation,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.navigation,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Start Navigation',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                _makePhoneCall(widget.userContactNo);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Contact Customer',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _makePhoneCall(String contactNo) async {
    final Uri phoneCallUri = Uri(
      scheme: 'tel',
      path: contactNo,
    );
    try {
      await launchUrl(phoneCallUri);
    } catch (e) {
      // Handle the exception here
      print('Could not launch $phoneCallUri: $e');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    mapController = controller; // Assign to mapController
  }

  void _onMapTapped(LatLng location) async {
    if (_destinationLocation != null) {
      setState(() {
        _destinationLocation = location;
        markers.add(_buildMarkerDestination('Destination Location', location));
      });

      _getPolyline(); // Recalculate the polyline
    }
  }

  Marker _buildMarkerDestination(String markerId, LatLng position) {
    return Marker(
      markerId: MarkerId(markerId),
      position: position,
      infoWindow: InfoWindow(title: markerId),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      rotation: _heading,
    );
  }

  void _startNavigation() async {
    if (_sourceLocation == null) {
      print("Source location is null");
      return;
    }

    final GoogleMapController controller = await _controller.future;

    final url = 'google.navigation:q=${_destinationLocation!.latitude},${_destinationLocation!.longitude}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _getPolyline() async {
    if (_sourceLocation == null || _destinationLocation == null) return;

    List<LatLng> polylineCoordinates = [];

    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyAKgqAyTO5G0rIf8laUc5_gOaF16Qwjg2Y', // Replace with your actual API key
      PointLatLng(_sourceLocation!.latitude, _sourceLocation!.longitude),
      PointLatLng(_destinationLocation!.latitude, _destinationLocation!.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {
      polylines.add(Polyline(
        polylineId: PolylineId('polyline'),
        color: kPrimaryColor,
        points: polylineCoordinates,
        width: 5,
      ));
    });

    // Calculate distance and estimated time
    if (polylineCoordinates.isNotEmpty) {
      _calculateDistanceAndTime();
    }
  }

  void _calculateDistanceAndTime() {
    double totalDistance = 0.0;

    for (int i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += _coordinateDistance(
        polylineCoordinates[i].latitude,
        polylineCoordinates[i].longitude,
        polylineCoordinates[i + 1].latitude,
        polylineCoordinates[i + 1].longitude,
      );
    }

    setState(() {
      _distance = totalDistance;
      _estimatedTime = (_distance / 40) * 60; // Assuming an average speed of 40 km/h
    });
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void updateFirestoreLocation(double latitude, double longitude) {
    FirebaseFirestore.instance
        .collection('orders')
        .doc(widget.orderId)
        .update({
      'latitude': latitude,
      'longitude': longitude,
    }).catchError((error) {
      print('Error updating Firestore location: $error');
    });
  }

  void _listenToDeviceOrientation() {
    _magnetometerSubscription =
        magnetometerEvents.listen((MagnetometerEvent event) {
          double x = event.x;
          double y = event.y;

          double heading = atan2(y, x) * (180 / pi);
          if (heading < 0) heading += 360;

          setState(() {
            _heading = heading;
          });
        });
  }

  void rotateMap() {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _sourceLocation!,
          zoom: 17,
          bearing: _lastBearing,
        ),
      ),
    );
  }
}
