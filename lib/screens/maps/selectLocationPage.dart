import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({Key? key}) : super(key: key);

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(24.871940013159495, 74.61263041137727),
    zoom: 14,
  );

  List<Marker> myMarker = [];
  late TextEditingController searchAddressController;
  late Set<Polyline> polylines = {};
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    searchAddressController = TextEditingController();
    _getCurrentLocation();
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
        14,
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
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _searchAddress(searchAddressController.text.toString());
                      },
                      child: Icon(Icons.search),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                      child: TextField(
                        controller: searchAddressController,
                        decoration: InputDecoration(
                          hintText: "Search Address",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        onSubmitted: _searchAddress,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        searchAddressController.clear();
                      },
                      child: Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
      width: 3,
    );

    setState(() {
      polylines.add(polyline);
    });
  }

  void _searchAddress(String address) async {
    try {
      setState(() {
        _loading = true;
      });

      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        final LatLng position = LatLng(location.latitude, location.longitude);
        _moveToPosition(position);
        setState(() {
          myMarker.add(
            Marker(
              markerId: MarkerId(address),
              position: position,
              infoWindow: InfoWindow(title: 'Selected Location'),
            ),
          );

          // Check if there are more than one markers
          if (myMarker.length > 1) {
            // Connect all markers with polyline
            _createPolyline(myMarker.map((marker) => marker.position).toList());
          }
        });
      }
    } catch (e) {
      print('Error occurred: $e');
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _moveToPosition(LatLng position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: position,
        zoom: 14,
      ),
    ));
  }
}
