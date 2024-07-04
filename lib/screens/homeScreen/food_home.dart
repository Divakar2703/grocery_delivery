import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../data/constants/app_constants_value.dart';
import '../../data/models/request/indextPageCountRequestModel.dart';
import '../../data/processResponse/status.dart';
import '../../helper/empty_animation.dart';
import '../../viewmodels/view_model_indext_page_count.dart';
import '../Orders/Componenets/All/simmer_order_list.dart';
import 'components/payments_card.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart' as perm;

class FoodHome extends StatefulWidget {
  const FoodHome({super.key});

  @override
  State<FoodHome> createState() => _FoodHomeState();
}

class _FoodHomeState extends State<FoodHome> {
  final loc.Location _location = loc.Location();
  late IndextPageCountViewModel indextPageCountViewModel;

  @override
  void initState() {
    super.initState();
    indextPageCountViewModel = IndextPageCountViewModel();
    getHomePageData();
    FlutterBackgroundService().configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        isForegroundMode: true,
      ),
      iosConfiguration: IosConfiguration(
        onForeground: onStart,
        onBackground: onIosBackground,
      ),
    );
  }

  void updateFirestoreLocation(double? latitude, double? longitude) {
    print('Latitude: $latitude, Longitude: $longitude');

    String currentDate = DateTime.now().toString(); // Get current date
    String orderId = "widget.orderId"; // Generate your order ID here

    FirebaseFirestore.instance.collection('Grocery').doc(orderId).set({
      'geolocation': GeoPoint(latitude!, longitude!),
      'date': currentDate,
      'rotation': 20,
      'destination': GeoPoint(latitude, longitude)
    }).then((value) {
      print("Location Updated in Firestore");
    }).catchError((error) {
      print("Failed to update location: $error");
    });
  }

  void onStart(ServiceInstance service) {
    if (service is AndroidServiceInstance) {
      service.setAsForegroundService();
    }

    service.on('stopService').listen((event) {
      service.stopSelf();
    });

    loc.Location location = loc.Location();
    location.onLocationChanged.listen((loc.LocationData currentLocation) {
      updateFirestoreLocation(
          currentLocation.latitude, currentLocation.longitude);
    });
  }

  static bool onIosBackground(ServiceInstance service) {
    WidgetsFlutterBinding.ensureInitialized();
    return true;
  }

  Future<void> scheduleLocationUpdates() async {
    await AndroidAlarmManager.initialize();
    await AndroidAlarmManager.periodic(
      const Duration(minutes: 15),
      0, // unique ID for the task
      backgroundTask,
      exact: true,
      wakeup: true,
    );
  }

  static Future<void> backgroundTask() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    loc.Location location = loc.Location();
    loc.LocationData currentLocation = await location.getLocation();
    _FoodHomeState().updateFirestoreLocation(currentLocation.latitude, currentLocation.longitude);
  }

  void askLocationPermission() async {
    final status = await perm.Permission.location.request();
    if (status == perm.PermissionStatus.granted) {
      getHomePageData();
    } else {
      getHomePageData();
      // Handle denied permission
      // You can display a message or navigate the user to a screen where they can manually enable location permission
    }
  }

  void getHomePageData() {
    final indexCountRequestmodel = IndextPageCountRequestModel(
      userId: Constants.userIdForUse,
    );

    indextPageCountViewModel.fetchIndextPageCountData(
      indexCountRequestmodel,
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ChangeNotifierProvider<IndextPageCountViewModel>(
        create: (BuildContext context) => indextPageCountViewModel,
        child: Consumer<IndextPageCountViewModel>(
          builder: (context, value, _) {
            switch (value.indextPageCountData.status ?? "") {
              case Status.LOADING:
                return Center(child: buildShimmerProductDetails());
              case Status.ERROR:
                return Center(child: emptyAnimationWidget());
              case Status.COMPLETED:
                return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              HomeCardView(cardTitle: "Total\nOrders",
                                  cardCount: value.indextPageCountData.data
                                      ?.totalFoodOrders.toString() ?? "",
                                  cardImage: "assets/images/m.png"),
                              const SizedBox(width: 10),
                              HomeCardView(cardTitle: "Complete\nOrders",
                                  cardCount: value.indextPageCountData.data
                                      ?.completeFoodOrders.toString() ?? "",
                                  cardImage: "assets/images/m1.png")
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              HomeCardView(cardTitle: "Packed\nOrders",
                                  cardCount: value.indextPageCountData.data
                                      ?.packedFoodOrders.toString() ?? "",
                                  cardImage: "assets/images/cc.png"),
                              const SizedBox(width: 10),
                              HomeCardView(cardTitle: "Total COD\nOrders",
                                  cardCount: value.indextPageCountData.data
                                      ?.totalCODFoodOrders.toString() ?? "",
                                  cardImage: "assets/images/p.png")
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              HomeCardView(
                                  cardTitle: "Total\nshipping\nOrderss",
                                  cardCount: value.indextPageCountData.data
                                      ?.totalShippingFoodOrders.toString() ?? "",
                                  cardImage: "assets/images/k.png"),
                              const SizedBox(width: 10),
                              HomeCardView(cardTitle: "Total\nReturn\nOrders",
                                  cardCount: value.indextPageCountData.data
                                      ?.totalReturnFoodOrders.toString() ?? "",
                                  cardImage: "assets/images/c.png")
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              HomeCardView(cardTitle: "Reject\nOrders",
                                  cardCount: value.indextPageCountData.data
                                      ?.totalRejectFoodOrders.toString() ?? "",
                                  cardImage: "assets/images/k.png"),
                              const SizedBox(width: 10),
                              HomeCardView(cardTitle: "Delivery\ncancel\norder",
                                  cardCount: value.indextPageCountData.data
                                      ?.deliveryCancelFoodOrder.toString() ?? "",
                                  cardImage: "assets/images/c.png")
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              HomeCardView(cardTitle: "Online\nOrders",
                                  cardCount: value.indextPageCountData.data
                                      ?.totalOnlineFoodOrders.toString() ?? "",
                                  cardImage: "assets/images/c.png"),
                              const SizedBox(width: 10),
                              HomeCardView(
                                  cardTitle: "Online\nPayment\ncollection",
                                  cardCount: value.indextPageCountData.data
                                      ?.totalOnlineFoodPaymentCollection
                                      .toString() ?? "",
                                  cardImage: "assets/images/k.png")
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              HomeCardView(
                                  cardTitle: "COD\nPayment\ncollection",
                                  cardCount: value.indextPageCountData.data
                                      ?.totalCODFoodPaymentCollection
                                      .toString() ?? "",
                                  cardImage: "assets/images/c.png"),
                              const SizedBox(width: 10),
                              HomeCardView(cardTitle: "Pending\nCOD\nPayments",
                                  cardCount: value.indextPageCountData.data
                                      ?.totalPendingFoodCODPayments
                                      .toString() ?? "",
                                  cardImage: "assets/images/k.png")
                            ],
                          ),
                        ],
                      ),
                    )
                );
            }

            return const SizedBox(); // Return an empty SizedBox if status is not loading or completed.
          },
        ),
      ),
    );
  }
}

