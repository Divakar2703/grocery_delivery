import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_delivery_side/new_init_screen.dart';
import 'package:grocery_delivery_side/screens/dashboard/Dashboard.dart';
import 'package:grocery_delivery_side/screens/login%20and%20Registration/login_page.dart';
import 'package:grocery_delivery_side/style/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/constants/app_constants_value.dart';
import 'constants.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;
  bool _isLogin = false;
  String? userId = '';

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: kPrimaryColor, // Set status bar color here
    ));
    const delay = const Duration(seconds: 3);
    Future.delayed(delay, () => onTimerFinished());
  }

  void onTimerFinished() async{
    setState(() {
      _isLoading = false;
    });
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    Constants.userIdForUse = sp.getString(Constants.userId) ?? '';
    _isLogin = sp.getBool(Constants.isLogin) ?? false;
    if(_isLogin){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
      );
    }else{
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginUser(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kPrimaryColor,
      body: Center(
        child: _isLoading ? lottieLoadingAnimation() : const SizedBox(),
      ),
    );
  }

  Widget lottieLoadingAnimation() {
    return Lottie.asset(
      'assets/animations/cart_anim.json', // Replace with the actual path to your JSON file
      width: 350,
      height: 350,
      fit: BoxFit.contain,
      animate: true,
      onLoaded: (composition) {
        // Do something when the animation is loaded
      },
    );
  }
}
