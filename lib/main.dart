
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import SystemChrome
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_delivery_side/splash_screen.dart';
import 'package:grocery_delivery_side/style/theme.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_order_list.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_order_list_food.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_phone_login.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_profile.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_register.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_send_otp.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_summary.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'data/constants/app_constants_value.dart';
import 'data/models/push_notification_model.dart';
import 'firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:overlay_support/overlay_support.dart';


@pragma('vm: entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Initialize Firebase even in background for data access if needed
  await Firebase.initializeApp();
  print("Handling background message: ${message.messageId}");

  // Extract notification data
  String title = message.notification?.title ?? '';
  String body = message.notification?.body ?? '';
  String dataTitle = message.data['title'] ?? '';
  String dataBody = message.data['body'] ?? '';

  // Create PushNotification object
  PushNotification notification = PushNotification(
    title: title,
    body: body,
    dataTitle: dataTitle,
    dataBody: dataBody,
  );
  

  // Handle the notification in the background (e.g., save data)
  // ... (your custom background notification processing logic)

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: AndroidNotificationDetails(
      'your_channel_id',
      'Your Channel Name',
      channelDescription: 'Your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      sound: RawResourceAndroidNotificationSound('sound_noti'), // Replace with your sound file name (in raw folder)
    ),
  );

  // **New:** Schedule notification for foreground display (if app is not running)
  await FlutterLocalNotificationsPlugin().show(
    0, // Notification ID (unique)
    title,
    body,
    platformChannelSpecifics,
  );
}


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Request notification permissions
  await requestNotificationPermission();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  runApp(const MyApp());
}

Future<void> requestNotificationPermission() async {
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission();
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted notification permission');
  } else {
    print('User declined notification permission');
  }
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  User? user;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    _firebaseMessaging.getToken().then((token) {
      print("Firebase Token: $token");
      Constants.fToken=token!;
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle incoming messages
      print("Received Message: ${message.notification?.body}");
      showSimpleNotification(
          Text(message.notification?.title ?? '', style: TextStyle(color: Colors.black,fontSize: 12)),
          subtitle: Text(message.notification?.body ?? '',style: TextStyle(color: Colors.black,fontSize: 10),),
          leading: SvgPicture.asset('assets/icons/Bell.svg'),
          background: Colors.yellow,
          duration: Duration(seconds: 10));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Set status bar color here
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:kPrimaryColor, // Replace with your desired color
      statusBarBrightness: Brightness.dark, // Change the brightness as needed
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PhoneLoginViewModel()),
        ChangeNotifierProvider(create: (_) => SendOtpViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => OrderListViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        // ChangeNotifierProvider(create: (_) => SummaryViewModel()),
        ChangeNotifierProvider(create: (_) => OrderListFoodViewModel()),


      ],
      child: OverlaySupport(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: FToastBuilder(),
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme(context),
          home: SplashScreen(),
        ),
      ),
    );

  }
}
