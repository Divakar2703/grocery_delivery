import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_profile.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:in_app_update/in_app_update.dart';

import '../../constants.dart';
import '../../data/constants/app_constants_value.dart';
import '../../data/models/request/indextPageCountRequestModel.dart';
import '../../viewmodels/view_model_indext_page_count.dart';
import 'components/home_header.dart';
import 'food_home.dart';
import 'grocery_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late IndextPageCountViewModel indextPageCountViewModel;
  late ProfileViewModel profileViewModel;
  final _selectedSegment = ValueNotifier('grocery'); // 'grocery' is selected initially
  AppUpdateInfo? _updateInfo;
  bool _flexibleUpdateAvailable = false;
  bool _isOnline = false;

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
  void initState() {
    super.initState();
    indextPageCountViewModel = IndextPageCountViewModel();
    profileViewModel = ProfileViewModel();
    askLocationPermission();
    checkForUpdate();
    _getProfileData();
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

  void askLocationPermission() async {
    final status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      // Permission granted
    } else {
      // Handle denied permission
    }
  }

  Future<void> checkForUpdate() async {
    print("===========================update");
    try {
      print("===========================update try");

      _updateInfo = await InAppUpdate.checkForUpdate();
      print("===========================_updateInfo $_updateInfo");
      if (_updateInfo?.updateAvailability == UpdateAvailability.updateAvailable) {
        print("===========================update updateAvailable");

        if (_updateInfo?.immediateUpdateAllowed == true) {
          print("===========================update updateAvailable true");

          InAppUpdate.performImmediateUpdate().catchError((e) {
            print("===========================update catchError $e");

            // Handle error
          });
        } else if (_updateInfo?.flexibleUpdateAllowed == true) {
          print("===========================update flexibleUpdateAllowed");

          setState(() {
            print("===========================update flexibleUpdateAllowed");

            _flexibleUpdateAvailable = true;
          });
        }
      }
    } catch (e) {
      print("===========================update error $e");

      // Handle error
    }
  }

  Future<void> startFlexibleUpdate() async {
    print("===========================startFlexibleUpdate ");

    if (_flexibleUpdateAvailable) {
      print("===========================startFlexibleUpdate if");

      InAppUpdate.startFlexibleUpdate().catchError((e) {
        print("===========================startFlexibleUpdate error $e");
        // Handle error
      });
    }
  }

  void _toggleOnlineStatus(bool value) async{

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

      print('API Response: $onlineStatus');
    } catch (e) {
      print('Error fetching online/offline data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Column(
          children: [
            Material(
              elevation: 4,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 32,16, 24),
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
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 38,
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AdvancedSegment(
                        segments: const {
                          'grocery': 'Grocery',
                          'food': 'Food',
                        },
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        controller: _selectedSegment,
                        backgroundColor: kPrimaryColor,
                      ),
                    ),
                    ValueListenableBuilder<String>(
                      valueListenable: _selectedSegment,
                      builder: (_, key, __) {
                        switch (key) {
                          case 'grocery':
                            return const GroceryHome();
                          case 'food':
                            return const FoodHome();
                          default:
                            return const GroceryHome();
                        }
                      },
                    ),
                    if (_flexibleUpdateAvailable)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: startFlexibleUpdate,
                          child: const Text('Update App'),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }
}
