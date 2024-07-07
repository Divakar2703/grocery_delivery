import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/constants.dart';
import 'package:grocery_delivery_side/new_init_food.dart';
import 'package:grocery_delivery_side/new_init_screen.dart';
import 'package:grocery_delivery_side/screens/homeScreen/home_screen_food.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../data/constants/app_constants_value.dart';
import '../../data/models/request/indextPageCountRequestModel.dart';
import '../../viewmodels/view_model_indext_page_count.dart';
import '../../viewmodels/view_model_profile.dart';
import 'components/home_header.dart';
import 'components/categories.dart';
import 'components/home_end_screen.dart';
import 'components/sliderbar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late IndextPageCountViewModel indextPageCountViewModel;
  late ProfileViewModel profileViewModel;
  bool _isOnline = false;

  @override
  void initState() {
    super.initState();
    indextPageCountViewModel = IndextPageCountViewModel();
    profileViewModel = ProfileViewModel();
    askLocationPermission();
    _getProfileData();
  }

  void askLocationPermission() async {
    final status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      // Permission granted
    } else {
      // Handle denied permission
    }
  }

  Future<void> _getProfileData() async {
    final data = IndextPageCountRequestModel(userId: Constants.userIdForUse);
    try {
      await profileViewModel.fetchProfileData(data, context);

      // Assuming `profileViewModel.getProfileData` is properly updated by `fetchProfileData`
      String onlineStatus = profileViewModel.getProfileData.data!.onlineStauts.toString();
      setState(() {
        _isOnline = (onlineStatus == 'online');
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching profile data: $e');
      }
    }
  }

  void _toggleOnlineStatus(bool value) async {
    // You can call a method here to update the online status in your ViewModel or backend
    final indexCountRequestmodel = IndextPageCountRequestModel(
      userId: Constants.userIdForUse,
    );

    try {
      final response = await indextPageCountViewModel.fetchOnlineOfflineData(
        indexCountRequestmodel,
        context,
      );

      String onlineStatus = indextPageCountViewModel.onlineOfflineData.data!.onlineStauts.toString();
      setState(() {
        _isOnline = (onlineStatus == 'online');
      });

      if (kDebugMode) {
        print('API Response: $onlineStatus');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching online/offline data: $e');
      }
    }
  }
  Future<bool> _onWillPop() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Exit'),
        content: const Text('Are you sure you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
        ],
      ),
    ) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            Material(
              elevation: 4,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    HomeHeader(
                      isOnline: _isOnline,
                      onStatusChanged: _toggleOnlineStatus,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    const SliderBar(),
                    const Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Instant Access 😋',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          // GestureDetector(
                          //   onTap: () {},
                          //   child: const Text(
                          //     'See all',
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.normal,
                          //         color: Colors.green),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    const Categories(),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Choose Your Way 🔥',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          // GestureDetector(
                          //   onTap: () {},
                          //   child: const Text(
                          //     'See all',
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.normal,
                          //         color: Colors.green),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const NewInitScrren()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 16, right: 8, bottom: 8),
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                color: kPrimaryLightColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 25,
                                    left: 26,
                                    right: 25,
                                    child:
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      child: Image.asset(
                                        'assets/images/img_grocery.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                  ),
                                  const Positioned(
                                    left: 16,
                                    bottom: 24,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          " Grocery Home",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const NewInitScrrenFood()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 8, right: 16, bottom: 8),
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                color: kPrimaryLightColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 25,
                                    left: 26,
                                    right: 25,
                                    child:
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      child: Image.asset(
                                        'assets/images/img_food.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    left: 16,
                                    bottom: 24,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "   Food Home",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    HomeEndScreen(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
