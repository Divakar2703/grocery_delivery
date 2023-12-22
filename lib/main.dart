import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import SystemChrome
import 'package:grocery_delivery_side/screens/homeScreen/home_screens.dart';
import 'package:grocery_delivery_side/theme.dart';

import 'constants.dart';
import 'init_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    // Set status bar color here
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:primaryColor, // Replace with your desired color
      statusBarBrightness: Brightness.dark, // Change the brightness as needed
    ));

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      home: const InitScreen(),
    );
  }
}
