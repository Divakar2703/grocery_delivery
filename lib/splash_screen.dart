import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/init_screen.dart';
import 'package:grocery_delivery_side/screens/login%20and%20Registration/login_page.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/constants/app_constants_value.dart';


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
          builder: (BuildContext context) {
            return InitScreen();
          },
        ),
      );
    }else{
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return LoginUser();
          },
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.greenAccent.shade100,
      body: Center(
        child: _isLoading ? lottieLoadingAnimation() : SizedBox(),
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
