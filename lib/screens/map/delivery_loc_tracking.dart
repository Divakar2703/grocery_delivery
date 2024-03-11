import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:grocery_app/screens/chat/chat_screen.dart';

import '../../styles/colors.dart';


class DeliveryLocTracking extends StatefulWidget {
  const DeliveryLocTracking({super.key});

  @override
  State<DeliveryLocTracking> createState() => _DeliveryLocTrackingState();
}

class _DeliveryLocTrackingState extends State<DeliveryLocTracking> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(24.871940013159495, 74.61263041137727),
    zoom: 17,
  );

  List<Marker> myMarker = [];
  late TextEditingController searchAddressController;
  late Set<Polyline> polylines = {};
  bool _loading = false;
  BitmapDescriptor locationIcon = BitmapDescriptor.defaultMarker;


  @override
  void initState() {
    super.initState();
    searchAddressController = TextEditingController();
    setCustommarkerIcon();
    _getCurrentLocation();
  }

  void setCustommarkerIcon() {
    // Create an ImageConfiguration with the desired dimensions
    ImageConfiguration configuration = ImageConfiguration(size: Size(48, 48));

    // Load the image with the specified configuration
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
        myMarker.add(
          Marker(
            markerId: MarkerId('Current Location'),
            position: LatLng(position.latitude, position.longitude),
            infoWindow: InfoWindow(title: 'Current Location'),
            icon: locationIcon
          ),
        );
        _moveCameraToCurrentLocation(position.latitude, position.longitude);
      });
    } catch (e) {
      print('Error getting current location: $e');
    }

    setState(() {
      _loading = false;
    });
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
    return
      Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: _initialPosition,
                mapType: MapType.normal,
                markers: Set<Marker>.of(myMarker),
                polylines: polylines,
                onTap: _onMapTapped,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              if (_loading)
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
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
              SizedBox(height: 8),
              Text(
                'Your Order is on the way, you can contact delivery boy by using below services.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Chat()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: Size(double.infinity, 45),
                  ),
                  child:
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: AppColors.white,
                      ),
                      SizedBox(width: 8), // Adjust the spacing as needed
                      Text(
                        'Contact Delivery Boy',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )

              ),

              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Chat()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: Size(double.infinity, 45),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.message_outlined,
                      color: AppColors.white,
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
              SizedBox(height: 24),
            ],
          ),
        ),
      );
  }

  void _onMapTapped(LatLng position) async {
    setState(() {
      _loading = true;
    });

    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      String completeAddress =
          '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.country}';
      setState(() {
        _loading = false;
        searchAddressController.text = completeAddress;
        myMarker.add(
          Marker(
            markerId: MarkerId(position.toString()),
            position: position,
            infoWindow: InfoWindow(title: 'Selected Location'),
              icon: locationIcon
          ),
        );

        // Check if there are more than one markers
        if (myMarker.length > 1) {
          // Connect all markers with polyline
          _createPolyline(myMarker.map((marker) => marker.position).toList());
        }
      });
    }
  }

  void _createPolyline(List<LatLng> points) {
    final PolylineId polylineId = PolylineId('poly');

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      color: Colors.blue,
      points: points,
      width: 2,
    );

    setState(() {
      polylines.add(polyline);
    });
  }



}
