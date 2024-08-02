import 'dart:async';
import 'dart:math' as math;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants.dart';


class DeliveryLocTracking extends StatefulWidget {
  final double sourceLat;
  final double sourceLong;
  final double destiLat;
  final double destiLong;
  final String orderId;
  final String userContactNo;

  // Specify the type of item parameter
  DeliveryLocTracking(
      {Key? key,
      required this.sourceLat,
      required this.sourceLong,
      required this.destiLat,
      required this.destiLong,
      required this.orderId, required this.userContactNo})
      : super(key: key);

  @override
  State<DeliveryLocTracking> createState() => _DeliveryLocTrackingState();
}

class _DeliveryLocTrackingState extends State<DeliveryLocTracking> {
  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  late TextEditingController searchAddressController;
  late Set<Marker> markers = {};
  late Set<Polyline> polylines = {};
  bool _loading = false;
  BitmapDescriptor locationIcon = BitmapDescriptor.defaultMarker;
  LatLng? _sourceLocation;
  LatLng? _destinationLocation;
  late StreamSubscription<Position> _positionStreamSubscription;
  double _lastBearing = 0.0;
  bool _isNavigationStarted = false;
  late StreamSubscription<GyroscopeEvent> _gyroscopeSubscription;
  List<LatLng> polylineCoordinates =
      []; // Declare polylineCoordinates as a member variable
  double _distance = 0.0;
  double _estimatedTime = 0.0;
  double rotationAngle = 0.0;
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
        // _sourceLocation = LatLng(widget.sourceLat, widget.sourceLong);
        markers.add(_buildMarker('Current Location', _sourceLocation!));
        _moveCameraToCurrentLocation(position.latitude, position.longitude);

        _destinationLocation = LatLng(widget.destiLat, widget.destiLong);
        if (_sourceLocation != null) {
          markers.removeWhere(
                  (marker) => marker.markerId.value == 'Destination Location');
          markers
              .add(_buildMarkerDestination('Destination Location', _destinationLocation!));
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
        // markers.clear();
        markers.add(_buildMarker('Current Location', _sourceLocation!));
        _lastBearing = bearing;
      });

      _getPolyline(); // Update polyline on location change if navigation started

      if (!polylineCoordinates.isEmpty) {
        // rotateMap();
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
                    ? CameraPosition(target: _sourceLocation!, zoom: 18)
                    : const CameraPosition(
                        target: LatLng(0, 0),
                        zoom: 2,
                      ),
                mapType: MapType.normal,
                markers: markers,
                polylines: polylines,
                // onTap: _onMapTapped,
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
                // _makePhoneCall();
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
    mapController = controller;
    // Rotate the map to align with the polyline
    // rotateMap();
  }

  void rotateMap() {
    rotationAngle = calculateBearingAngle();
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: polylineCoordinates.first,
          zoom: 18,
          bearing: rotationAngle,
        ),
      ),
    );
  }

  double calculateBearingAngle() {
    LatLng point1 = polylineCoordinates[0];
    LatLng point2 = polylineCoordinates[1];

    double lat1 = point1.latitude * pi / 180;
    double lon1 = point1.longitude * pi / 180;
    double lat2 = point2.latitude * pi / 180;
    double lon2 = point2.longitude * pi / 180;

    double y = sin(lon2 - lon1) * cos(lat2);
    double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(lon2 - lon1);
    double bearing = atan2(y, x) * 180 / pi;

    return bearing;
  }

  // void _startNavigation() {
  //   setState(() {
  //     _isNavigationStarted = true;
  //   });
  //   _getPolyline().then((_) {
  //     _moveCameraToBounds();
  //     // rotateMap();
  //   });
  // }

  void _moveCameraToBounds() async {
    if (_sourceLocation != null && _destinationLocation != null) {
      final GoogleMapController controller = await _controller.future;
      LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(
          math.min(_sourceLocation!.latitude, _destinationLocation!.latitude),
          math.min(_sourceLocation!.longitude, _destinationLocation!.longitude),
        ),
        northeast: LatLng(
          math.max(_sourceLocation!.latitude, _destinationLocation!.latitude),
          math.max(_sourceLocation!.longitude, _destinationLocation!.longitude),
        ),
      );
      controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100));
    }
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

  void _onMapTapped(LatLng position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      String completeAddress =
          '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.country}';
      searchAddressController.text = completeAddress;

      setState(() {
        _destinationLocation = position;
        _destinationLocation = LatLng(widget.destiLat, widget.destiLong);
        if (_sourceLocation != null) {
          markers.removeWhere(
              (marker) => marker.markerId.value == 'Destination Location');
          markers
              .add(_buildMarkerDestination('Destination Location', position));
          markers.add(_buildMarker('Current Location', _sourceLocation!));
        }
        _getPolyline();
      });
    }
  }
  // AIzaSyAKgqAyTO5G0rIf8laUc5_gOaF16Qwjg2Y
  Marker _buildMarkerDestination(String markerId, LatLng position) {
    return Marker(
      markerId: MarkerId(markerId),
      position: position,
      infoWindow: InfoWindow(title: markerId),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
  }

  Future<void> _getPolyline() async {
    _destinationLocation = LatLng(widget.destiLat, widget.destiLong);
    // if (_sourceLocation != null && _destinationLocation != null) {
    //   PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates(
    //     'AIzaSyAKgqAyTO5G0rIf8laUc5_gOaF16Qwjg2Y',
    //     PointLatLng(_sourceLocation!.latitude, _sourceLocation!.longitude),
    //     PointLatLng(
    //         _destinationLocation!.latitude, _destinationLocation!.longitude),
    //   );
    //
    //   if (result.points.isNotEmpty) {
    //     List<PointLatLng> decodedPoints = result.points;
    //
    //     // Convert List<PointLatLng> to List<LatLng>
    //     polylineCoordinates = decodedPoints
    //         .map((point) => LatLng(point.latitude, point.longitude))
    //         .toList();
    //
    //     setState(() {
    //       polylines.clear();
    //       updateFirestoreLocation(
    //           _sourceLocation!.latitude, _sourceLocation!.longitude);
    //       // rotateMap();
    //       polylines.add(Polyline(
    //           polylineId: const PolylineId('route'),
    //           color: Colors.blueAccent,
    //           points: polylineCoordinates,
    //           width: 5));
    //       _calculateDistanceAndTime(polylineCoordinates);
    //     });
    //   }
    // }
  }

  // Function to calculate distance between two points
  double calculateDistance(LatLng point1, LatLng point2) {
    return Geolocator.distanceBetween(
      point1.latitude,
      point1.longitude,
      point2.latitude,
      point2.longitude,
    );
  }

// Function to calculate total distance along a polyline
  double calculateDistanceAlongPolyline(List<LatLng> polylinePoints) {
    double distance = 0.0;
    for (int i = 0; i < polylinePoints.length - 1; i++) {
      distance += calculateDistance(polylinePoints[i], polylinePoints[i + 1]);
    }
    return distance;
  }

// Function to calculate reach time in a readable format
  String calculateReachTime(double durationInMinutes) {
    int hours = durationInMinutes ~/ 60;
    double minutes = durationInMinutes % 60;
    int seconds = ((durationInMinutes - minutes) * 60).toInt();

    if (hours > 0) {
      return "$hours hours ${minutes.toStringAsFixed(0)} mins";
    } else if (minutes >= 1) {
      return "${minutes.toStringAsFixed(0)} mins";
    } else {
      return "$seconds sec";
    }
  }

// The function to calculate the distance and estimated time
  void _calculateDistanceAndTime(List<LatLng> polylinePoints) {
    if (polylinePoints.isEmpty) {
      print("Polyline points list is empty");
      return;
    }

    // Calculate total distance along the polyline
    double totalDistance = calculateDistanceAlongPolyline(polylinePoints);

    // Convert distance to kilometers
    double distanceInKm = totalDistance / 1000;

    // Calculate estimated time (assuming average speed of 30 km/hr)
    double estimatedTimeInMinutes = (distanceInKm / 30) * 60;

    // Use the calculated values as needed
    String distanceDisplay;
    if (distanceInKm >= 1) {
      distanceDisplay = "${distanceInKm.toStringAsFixed(1)} km";
    } else {
      distanceDisplay = "${totalDistance.toStringAsFixed(1)} meters";
    }

    print("Total Distance: $distanceDisplay");
    print("Estimated Time: ${calculateReachTime(estimatedTimeInMinutes)}");

    // If you need to update the state
    setState(() {
      _distance = distanceInKm;
      _estimatedTime = estimatedTimeInMinutes;
    });
  }


  void updateFirestoreLocation(double latitude, double longitude) {
    print('Latitude: $latitude, Longitude: $longitude');

    String currentDate = DateTime.now().toString(); // Get current date
    // String orderId = "order123"; // Generate your order ID here
    String orderId = widget.orderId; // Generate your order ID here

    FirebaseFirestore.instance.collection('Grocery').doc(orderId).set({
      'geolocation': GeoPoint(latitude, longitude),
      'date': currentDate,
      'rotation': _heading,
      'destination': GeoPoint(
          _destinationLocation!.latitude, _destinationLocation!.longitude)
    }).then((value) {
      print("Location Updated in Firestore");
    }).catchError((error) {
      print("Failed to update location: $error");
    });
  }

  void _listenToDeviceOrientation() {
    _magnetometerSubscription = magnetometerEvents.listen((MagnetometerEvent event) {
      if (mounted) {
        setState(() {
          _heading = _calculateHeading(event.x, event.y);
        });
      }
    });
  }

  double _calculateHeading(double x, double y) {
    return (360 - (atan2(x, y) * (180 / pi))) % 360;
  }

}
