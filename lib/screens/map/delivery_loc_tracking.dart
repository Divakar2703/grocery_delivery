import 'dart:async';
import 'dart:math' as math;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:grocery_delivery_side/screens/chats/chat.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants.dart';

class DeliveryLocTracking extends StatefulWidget {
  const DeliveryLocTracking({Key? key}) : super(key: key);

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
  List<LatLng> polylineCoordinates = []; // Declare polylineCoordinates as a member variable

  double _currentRotation = 0.0; // Current device rotation

  @override
  void initState() {
    super.initState();
    searchAddressController = TextEditingController();
    setCustommarkerIcon();
    _startGyroscopeUpdates();
    _getCurrentLocation();
    _startLocationUpdates();
  }

  @override
  void dispose() {
    _positionStreamSubscription.cancel();
    _gyroscopeSubscription.cancel();
    super.dispose();
  }


  void _startGyroscopeUpdates() {
    _gyroscopeSubscription = gyroscopeEventStream().listen((GyroscopeEvent event) {
      setState(() {
        _currentRotation = event.z; // You might need to adjust which sensor event to use based on your device's orientation
      });
    });
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
      rotation: _currentRotation,
    );
  }

  void _startLocationUpdates() {
    _positionStreamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
          double bearing = _calculateBearing(
              _sourceLocation!.latitude,
              _sourceLocation!.longitude,
              position.latitude,
              position.longitude);
          setState(() {
            updateFirestoreLocation(position.latitude, position.longitude);
            _sourceLocation = LatLng(position.latitude, position.longitude);
            // markers.clear();
            markers.add(_buildMarker('Current Location', _sourceLocation!));
            _lastBearing = bearing;

          });
          if (_isNavigationStarted) {
            _getPolyline(); // Update polyline on location change if navigation started
          }
          if(!polylineCoordinates.isEmpty){
            rotateMap();
          }
        });
  }

  double _calculateBearing(
      double startLatitude, double startLongitude, double endLatitude, double endLongitude) {
    double theta = math.atan2(endLongitude - startLongitude, endLatitude - startLatitude);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _sourceLocation != null
                  ? CameraPosition(
                target: _sourceLocation!,
                zoom: 17
              )
                  : const CameraPosition(
                target: LatLng(0, 0),
                zoom: 2,
              ),
              mapType: MapType.normal,
              markers: markers,
              polylines: polylines,
              onTap: _onMapTapped,
              onMapCreated: _onMapCreated
            ),
            if (_loading)
              const Center(
                child: CircularProgressIndicator(),
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
            const SizedBox(height: 8,),
            ElevatedButton(
              onPressed: _startNavigation,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 45),
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
            const SizedBox(height: 8,),
            ElevatedButton(
              onPressed: _startNavigation,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 45),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Drop message to Delivery Boy',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8,),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Chat()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 45),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Contact to Delivery boy',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height:8),
          ],
        ),
      ),
    );
  }
  void _startCall() async {
    const phoneNumber = '9024232511'; // phone number to call
    final Uri url = 'tel:$phoneNumber' as Uri;

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void _onMapCreated(GoogleMapController controller) {

    _controller.complete(controller);
    mapController = controller;
    // Rotate the map to align with the polyline
    rotateMap();
  }
  void rotateMap() {
    double rotationAngle = calculateBearingAngle();
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: polylineCoordinates.first,
          zoom: 17,
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

  void _startNavigation() {
    setState(() {
      _isNavigationStarted = true;
    });
    _getPolyline().then((_) {
      _moveCameraToBounds();
      rotateMap();
    });
  }


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



  void _onMapTapped(LatLng position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      String completeAddress = '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.country}';
      searchAddressController.text = completeAddress;

      setState(() {
        _destinationLocation = position;
        if (_sourceLocation != null) {
          markers.removeWhere((marker) => marker.markerId.value == 'Destination Location');
          markers.add(_buildMarkerDestination('Destination Location', position));
          markers.add(_buildMarker('Current Location', _sourceLocation!));
        }
        _getPolyline();

      });

    }
  }


  Marker _buildMarkerDestination(String markerId, LatLng position) {
    return Marker(
      markerId: MarkerId(markerId),
      position: position,
      infoWindow: InfoWindow(title: markerId),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
  }


  Future<void> _getPolyline() async {
    if (_sourceLocation != null && _destinationLocation != null) {
      PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates(
        'AIzaSyAKgqAyTO5G0rIf8laUc5_gOaF16Qwjg2Y', // Replace with your Google Maps API Key
        PointLatLng(_sourceLocation!.latitude, _sourceLocation!.longitude),
        PointLatLng(_destinationLocation!.latitude, _destinationLocation!.longitude),
      );

      if (result.points.isNotEmpty) {
        List<PointLatLng> decodedPoints = result.points;

        // Convert List<PointLatLng> to List<LatLng>
        polylineCoordinates = decodedPoints
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList();

        setState(() {
          polylines.clear();
          updateFirestoreLocation(_sourceLocation!.latitude, _sourceLocation!.longitude);
          rotateMap();
          polylines.add(Polyline(
            polylineId: const PolylineId('route'),
            color: Colors.black,
            points: polylineCoordinates,
            width: 2
          ));
        });
      }
    }
  }


  void updateFirestoreLocation(double latitude, double longitude) {
    print('Latitude: $latitude, Longitude: $longitude');

    String currentDate = DateTime.now().toString(); // Get current date
    String orderId = "Order123"; // Generate your order ID here

    FirebaseFirestore.instance
        .collection('Grocery')
        .doc(orderId)
        .set({
      'geolocation': GeoPoint(latitude, longitude),
      'date': currentDate,
      'rotation':_currentRotation,
      'destination': GeoPoint(_destinationLocation!.latitude, _destinationLocation!.longitude)
    })
        .then((value) {
      print("Location Updated in Firestore");
    })
        .catchError((error) {
      print("Failed to update location: $error");
    });
  }

}
