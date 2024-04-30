import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';

import '../../constants.dart';
import 'orders_list_tab_screen.dart';


enum Segment {
  all,
  starred,
}

extension SegmentsExtension on Segment {
  String get label {
    switch (this) {
      case Segment.all:
        return 'All Files';
      case Segment.starred:
        return 'Starred Files';
      default:
        return 'Unrecognized';
    }
  }
  bool get isAll => this == Segment.all;
  bool get isStarred => this == Segment.starred;
}

class ParentOrderListFoodGrocery extends StatefulWidget {
  const ParentOrderListFoodGrocery({super.key});
  @override
  State<ParentOrderListFoodGrocery> createState() => _ParentOrderListFoodGroceryState();
}

class _ParentOrderListFoodGroceryState extends State<ParentOrderListFoodGrocery> {
  final _selectedSegment = ValueNotifier('grocery');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'All Ordered List',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Muli',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 10,),
            // Container(
            //   height: 38,
            //   width: double.maxFinite,
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 16,
            //   ),
            //   child: AdvancedSegment(
            //     segments: {
            //       'grocery': 'Grocery Orders',
            //       'food': 'Food Orders',
            //     },
            //     borderRadius: BorderRadius.all(Radius.circular(10)),
            //     controller: _selectedSegment,
            //     backgroundColor: kPrimaryColor,
            //   ),
            // ),
            // ValueListenableBuilder<String>(
            //   valueListenable: _selectedSegment,
            //   builder: (_, key, __) {
            //     switch (key) {
            //       case 'grocery':
            //         return OrderScreenNew();
            //       case 'food': // Corrected the case label
            //         return OrderScreenNew(); // or replace with the appropriate widget for starred data
            //       default:
            //         return OrderScreenNew();
            //     }
            //   },
            // ),

            DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  ButtonsTabBar(
                    height: 35,
                    buttonMargin: const EdgeInsets.symmetric(horizontal: 16),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    backgroundColor: kPrimaryColor,
                    unselectedBackgroundColor: Colors.grey[300],
                    unselectedLabelStyle: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Muli",
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Muli",
                    ),
                    tabs: const [
                      Tab(
                        text: "      Grocery      ",
                      ),
                      Tab(
                        text: "       Food          ",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        OrderScreenNew(),
                        OrderScreenNew(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
