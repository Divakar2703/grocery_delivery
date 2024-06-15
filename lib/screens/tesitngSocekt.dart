import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:convert'; // Import the json library


class TestingSocketIO extends StatefulWidget {
  @override
  _TestingSocketIOState createState() => _TestingSocketIOState();
}

class _TestingSocketIOState extends State<TestingSocketIO> {
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    // Connect to your Socket.IO server
    socket = IO.io('https://asatvindia.in:5001', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.onConnect((_) {
      print('Connected');
    });
    socket.onDisconnect((_) {
      print('Disconnected');
    });
    socket.on('event_name', (data) {
      print('Received: $data');
      // Handle received data here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Socket.IO Demo'),
      ),
      body: Center(
        child: Text('Socket.IO Demo'),
      ),
      floatingActionButton: Center(
        child: FloatingActionButton(
          onPressed: () {
            // Send data to the server
            // socket.emit('event_name', 'Hello, Socket.IO!');
            updateLocation("123456", "0.0", "0.0");

          },
          child: Icon(Icons.send),
        ),
      ),
    );
  }

  void updateLocation(String booking_id, String latitude, String longitude) {
    print('Updating location - Booking ID: $booking_id, Latitude: $latitude, Longitude: $longitude');

    // Create a Map with the location data including driver_id, user_id, booking_id, latitude, and longitude
    Map<String, dynamic> locationData = {
      "driver_id": "3",
      "user_id": "5",
      "booking_id": booking_id,
      "latitude": latitude,
      "longitude": longitude,
    };

    // Convert the Map to a JSON string
    String jsonString = json.encode(locationData);

    // Emit an event to the server with the location data
    socket.emit('updateLocation', [jsonString]);
  }


  @override
  void dispose() {
    if (socket.connected) {
      socket.disconnect();
    }
    super.dispose();
  }

}