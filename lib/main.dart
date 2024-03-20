import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import SystemChrome
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_delivery_side/screens/homeScreen/home_screens.dart';
import 'package:grocery_delivery_side/screens/login%20and%20Registration/login_page.dart';
import 'package:grocery_delivery_side/splash_screen.dart';
import 'package:grocery_delivery_side/theme.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_order_list.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_phone_login.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_register.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_send_otp.dart';
import 'package:provider/provider.dart';

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
      statusBarColor:kPrimaryColor, // Replace with your desired color
      statusBarBrightness: Brightness.dark, // Change the brightness as needed
    ));
    //
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   debugShowCheckedMode
    //   Banner: false,
    //   theme: AppTheme.lightTheme(context),
    //   home: const LoginUser(),
    // );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PhoneLoginViewModel()),
        ChangeNotifierProvider(create: (_) => SendOtpViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => OrderListViewModel()),
        // ChangeNotifierProvider(create: (_) => SubsPlanViewModel()),
        // ChangeNotifierProvider(create: (_) => ReserverClubViewModel()),
        // ChangeNotifierProvider(create: (_) => ProfileViewModel()),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: FToastBuilder(),
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme(context),
        home: InitScreen(),
      ),
    );

  }
}
