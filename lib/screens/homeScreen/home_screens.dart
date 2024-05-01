import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:permission_handler/permission_handler.dart';

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
  }

  void askLocationPermission() async {
    final status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      // Permission granted
    } else {
      // Handle denied permission
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
                    // SizedBox(height: 8),
                    // SearchField(),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
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
                    // DefaultTabController(
                    //   length: 2,
                    //   child: Column(
                    //     children: <Widget>[
                    //       const SizedBox(height: 20),
                    //       ButtonsTabBar(
                    //         height: 35,
                    //         buttonMargin: const EdgeInsets.symmetric(horizontal: 16),
                    //         contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    //         backgroundColor: kPrimaryColor,
                    //         unselectedBackgroundColor: Colors.grey[300],
                    //         unselectedLabelStyle: const TextStyle(
                    //           color: Colors.black,
                    //           fontFamily: "Muli",
                    //         ),
                    //         labelStyle: const TextStyle(
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.bold,
                    //           fontFamily: "Muli",
                    //         ),
                    //         tabs: const [
                    //           Tab(
                    //             text: "      Grocery      ",
                    //           ),
                    //           Tab(
                    //             text: "       Food          ",
                    //           ),
                    //         ],
                    //       ),
                    //       Expanded(
                    //         child: TabBarView(
                    //           children: <Widget>[
                    //             GroceryHome(),
                    //             FoodHome(),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100.0,)
          ],
        ),
      ),
    );
  }
}
