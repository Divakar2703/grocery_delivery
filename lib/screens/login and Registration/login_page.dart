import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_delivery_side/data/models/request/PhoneLoginRequestModel.dart';
import 'package:grocery_delivery_side/screens/login%20and%20Registration/ragistation.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_phone_login.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../constants.dart';
import '../../data/constants/app_constants_value.dart';
import '../../data/models/push_notification_model.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  late FirebaseMessaging messaging;
  int _totalNotifications = 0;
  late PushNotification _notificationInfo;

  Future<void> registerNotification() async {
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Message title: ${message.notification?.title}');
        // Parse the message received
        PushNotification notification = PushNotification(
          title: message.notification?.title ?? '',
          body: message.notification?.body ?? '',
          dataTitle: message.data['title'] ?? '',
          dataBody: message.data['body'] ?? '',
        );
        setState(() {
          _notificationInfo = notification;
          _totalNotifications++;
        });

        if(_notificationInfo != null){
          showSimpleNotification(Text(_notificationInfo.title),
          subtitle: Text(_notificationInfo.body??''),
          background: kPrimaryColor,
          duration: Duration(seconds: 2));
        }
      });
    }else{
      print('User Declined or not accepted the permission');
    }
  }

  // For handling the notifications in terminated state
  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      // Parse the message received
      PushNotification notification = PushNotification(
        title: initialMessage.notification?.title ?? "",
        body: initialMessage.notification?.body ?? "",
        dataTitle: initialMessage.data['title'] ?? "",
        dataBody: initialMessage.data['body'] ?? "",
      );
      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    }
  }


  TextEditingController mobileController = TextEditingController();
  PhoneLoginViewModel phoneLoginViewModel = PhoneLoginViewModel();
  bool _isLoading = false;

  void askLocationPermission() async {
    final status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      showToast("Permission Granted!..");
    } else {
      showToast("Permission Denied!..");
      // Handle denied permission
      // You can display a message or navigate the user to a screen where they can manually enable location permission
    }
  }

  @override
  void initState() {
    super.initState();
    _totalNotifications = 0;
    // registerNotification();
    // checkForInitialMessage();

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   // Extract notification data
    //   String notificationTitle = message.notification?.title ?? '';
    //   String notificationBody = message.notification?.body ?? '';
    //   String dataTitle = message.data['title'] ?? '';
    //   String dataBody = message.data['body'] ?? '';
    //
    //   // Update notification info and total count
    //   setState(() {
    //     _notificationInfo = PushNotification(
    //       title: notificationTitle,
    //       body: notificationBody,
    //       dataTitle: dataTitle,
    //       dataBody: dataBody,
    //     );
    //     _totalNotifications++;
    //   });
    // });

  }
  void checkValidation() {
    if (mobileController.text.toString().length >= 10) {
      getUserId();
    } else {
      showToast('Please enter valid mobile no.!');
    }
  }

  Future<void> getUserId() async {
    setState(() {
      _isLoading = true;
    });

    final phoneLoginRequestmodel = PhoneLoginRequestModel(
      phone: mobileController.text.toString(),
      fTokan: Constants.fToken
    );

    await phoneLoginViewModel.fetchPhoneLoginData(
        phoneLoginRequestmodel, context);

    setState(() {
      _isLoading = false;
    });
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Image(image: AssetImage("assets/images/d2.png")),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Enter your mobile number to get OTP',
                        style: TextStyle(
                            fontFamily: 'Muli',
                            color: Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: mobileController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixText: "+91 | ",
                      prefixIcon: const Icon(Icons.person),
                      fillColor: kPrimaryLightColor,
                      filled: true,
                      hintText: 'Enter Your Mobile No.',
                      contentPadding: const EdgeInsets.all(8),
                      hintStyle: const TextStyle(
                        fontFamily: 'Muli',
                        color: Color(0xff0C134F),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                _isLoading
                    ? const CircularProgressIndicator() // Show progress indicator when loading
                    : InkWell(
                        onTap: () {
                          checkValidation();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              border: Border.all(color: Colors.white38),
                              borderRadius: BorderRadius.circular(12)),
                          height: 50,
                          child: const Center(
                            child: Text(
                              'Get OTP',
                              style: TextStyle(
                                fontFamily: 'Muli',
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Muli',
                            color: Colors.black54,
                            fontSize: 12),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(
                            fontFamily: 'Muli',
                            decoration: TextDecoration.underline,
                            color: Colors.black87,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
