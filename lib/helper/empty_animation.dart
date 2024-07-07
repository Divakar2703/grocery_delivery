import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget emptyAnimationWidget() {
  return Center(
    child: Lottie.asset(
      'assets/animations/no_data.json', // Replace with your animation file path
      width: 200,
      height: 200,
      fit: BoxFit.cover,
    ),
  );
}

Widget loadingAnimationWidget() {
  return Center(
    child: Lottie.asset(
      'assets/animations/loading_grocery.json', // Replace with your animation file path
      width: 200,
      height: 200,
      fit: BoxFit.cover,
    ),
  );
}

Widget noFoodAnimationWidget() {
  return Center(
    child: Lottie.asset(
      'assets/animations/food_no_data.json', // Replace with your animation file path
      width: double.infinity,
      height: 200,
      fit: BoxFit.cover,
    ),
  );
}
