import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/style/colors.dart';

import '../constants.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Color(0xF2F6FAF6),
      fontFamily: "Muli",
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black)),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: kTextColor),
        bodyMedium: TextStyle(color: kTextColor),
        bodySmall: TextStyle(color: kTextColor),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        border: outlineInputBorder,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 48),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
    );
  }
}
const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(28)),
  borderSide: BorderSide(color: kTextColor),
  gapPadding: 10,
);

String mulishFontFamily = "mulish";

// Light theme
ThemeData lightThemeData = ThemeData(
  fontFamily: mulishFontFamily,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.primaryColor, // Set secondary color to primary color
    background: Colors.white, // Set background color to white
    brightness: Brightness.light, // Set brightness to light
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color:
    AppColors.primaryColor, // Set progress indicator color to primary color
  ),
);

// Dark theme
ThemeData darkThemeData = ThemeData(
  fontFamily: mulishFontFamily,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.primaryColor, // Set secondary color to primary color
    background: AppColors.white,
    // Set background color to black
    brightness: Brightness.dark, // Set brightness to dark
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color:
    AppColors.primaryColor, // Set progress indicator color to primary color
  ),
);

// Define a function to toggle between light and dark themes
ThemeData toggleTheme(bool isDarkMode) {
  return isDarkMode ? darkThemeData : lightThemeData;
}

