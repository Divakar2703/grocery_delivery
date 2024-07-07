import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:grocery_delivery_side/screens/Wallet%20&%20Cod%20Summary/food/foodCodWidget.dart';
import 'package:grocery_delivery_side/screens/Wallet%20&%20Cod%20Summary/food/foodWalletWidget.dart';

import '../../../constants.dart';



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

class FoodSummaryScreen extends StatefulWidget {
  const FoodSummaryScreen({super.key});

  @override
  State<FoodSummaryScreen> createState() => _FoodSummaryScreenState();
}

class _FoodSummaryScreenState extends State<FoodSummaryScreen> {
  final _selectedSegment = ValueNotifier('cod'); // 'cod' is selected initially

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food COD & Wallet Summary',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Muli',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: kPrimaryColorFood,
        automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // SizedBox(height: 10,),
              //
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Material(
              //           borderRadius: BorderRadius.circular(12),
              //           elevation: 3,
              //           child: InkWell(
              //             onTap: (){
              //               Navigator.pushReplacement(
              //                 context,
              //                 PageRouteBuilder(
              //                   pageBuilder: (context, animation, secondaryAnimation) =>  GrocerySummaryHomeScreen(),
              //
              //                   transitionsBuilder: (context, animation, secondaryAnimation, child) {
              //                     const begin = Offset(-1.0, 0.0);
              //                     const end = Offset.zero;
              //                     const curve = Curves.ease;
              //
              //                     var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              //
              //                     return SlideTransition(
              //                       position: animation.drive(tween),
              //                       child: child,
              //                     );
              //                   },
              //
              //                 ),
              //               );
              //             },
              //             child: const SizedBox(
              //               height: 40,
              //               child: Center(
              //                 child: Text(
              //                   'Grocery',
              //                   style: TextStyle(color: Colors.black),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //
              //       const SizedBox(width: 16),
              //       Expanded(
              //         child: Material(
              //           borderRadius: BorderRadius.circular(12),
              //           elevation: 3,
              //           color: kPrimaryColor,
              //           child: InkWell(
              //             onTap: (){
              //
              //             },
              //             child: const SizedBox(
              //               height: 40,
              //               child: Center(
              //                 child: Text(
              //                   'Food',
              //                   style: TextStyle(color: Colors.black),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              //
              // ),
              const SizedBox(height: 10,),
              Container(
                height: 38,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: AdvancedSegment(
                  segments: {
                    'cod': 'COD Summary',
                    'wallet': 'Wallet Summary',

                  },
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  controller: _selectedSegment,
                  backgroundColor: kPrimaryColorFood,
                ),
              ),
              ValueListenableBuilder<String>(
                valueListenable: _selectedSegment,
                builder: (_, key, __) {
                  switch (key) {
                    case 'wallet':
                      return const FoodWalletWidgets();
                    case 'cod': // Corrected the case label
                      return const FoodCodWidget(); // or replace with the appropriate widget for starred data
                    default:
                      return const FoodCodWidget();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
