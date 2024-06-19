import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:in_app_update/in_app_update.dart';

import '../../constants.dart';
import '../../viewmodels/view_model_indext_page_count.dart';
import 'components/home_header.dart';
import 'components/search_field.dart';
import 'food_home.dart';
import 'grocery_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late IndextPageCountViewModel indextPageCountViewModel;
  final _selectedSegment = ValueNotifier('grocery'); // 'grocery' is selected initially
  AppUpdateInfo? _updateInfo;
  bool _flexibleUpdateAvailable = false;

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
    askLocationPermission();
    checkForUpdate();
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
    try {
      _updateInfo = await InAppUpdate.checkForUpdate();
      if (_updateInfo?.updateAvailability == UpdateAvailability.updateAvailable) {
        if (_updateInfo?.immediateUpdateAllowed == true) {
          InAppUpdate.performImmediateUpdate().catchError((e) {
            // Handle error
          });
        } else if (_updateInfo?.flexibleUpdateAllowed == true) {
          setState(() {
            _flexibleUpdateAvailable = true;
          });
        }
      }
    } catch (e) {
      // Handle error
    }
  }

  Future<void> startFlexibleUpdate() async {
    if (_flexibleUpdateAvailable) {
      InAppUpdate.startFlexibleUpdate().catchError((e) {
        // Handle error
      });
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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
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
                child: const Column(
                  children: [
                    SizedBox(height: 20),
                    HomeHeader(),
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
                        segments: {
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
