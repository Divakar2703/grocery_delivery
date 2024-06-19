import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  //One instance, needs factory
  static AppColors? _instance;
  factory AppColors() => _instance ??= AppColors._();

  AppColors._();

  static const primaryColor = Colors.green;
  static const primaryColor2 = Color(0xff53B175);
  static const statusBarColor =  Color(0xff81c784);
  static const primaryColorLightColor = Color(0xffbdfad3);
  static const darkGrey = Color(0xff7C7C7C);
  static const lightGreen = Color(0xFFA2E0C9);
  static const lightGreenDeliveryStatus = Color(0xFFC8E5C9FF);
  static const lightGreyGreen = Color(0xFFCDECE0);
  static const categoryCardColor = Color(0xFFe5f3f3);
  static const white = Color.fromARGB(255, 255, 255, 255);
  static const blue = Color.fromARGB(255, 58, 117, 246);
  static const lightBlue = Color(0xffbbd0f1);
  static const categoryCardColor2 = Color(0xffd5f6f6);

  //for food
  static Color get secondary => const Color(0xffFF7966);
  static Color get secondary50 => const Color(0xffFFA699);
  static Color get secondary0 => const Color(0xffFFD2CC);

  //extra
  static Color get gray => const Color(0xff0E0E12);
  static Color get gray80 => const Color(0xff1C1C23);
  static Color get gray70 => const Color(0xff353542);
  static Color get gray60 => const Color(0xff4E4E61);
  static Color get gray50 => const Color(0xff666680);
  static Color get gray40 => const Color(0xff83839C);
  static Color get gray30 => const Color(0xffA2A2B5);
  static Color get gray20 => const Color(0xffC1C1CD);
  static Color get gray10 => const Color(0xffE0E0E6);
  static Color get border => const Color(0xffCFCFFC);
}
