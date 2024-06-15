import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:grocery_delivery_side/screens/Wallet%20&%20Cod%20Summary/food/foodSummaryScreen.dart';
import 'package:grocery_delivery_side/screens/Wallet%20&%20Cod%20Summary/grocery/walletWidget.dart';
import '../../../constants.dart';
import '../../../new_init_screen.dart';
import 'codWidget.dart';

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

class GrocerySummaryHomeScreen extends StatefulWidget {
  @override
  _GrocerySummaryHomeScreenState createState() => _GrocerySummaryHomeScreenState();
}

class _GrocerySummaryHomeScreenState extends State<GrocerySummaryHomeScreen> {
  final _selectedSegment = ValueNotifier('cod'); // 'cod' is selected initially

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => NewInitScrren()),
                  (Route<dynamic> route) => false,
            );
          },
        ),
        title: Text(
          'COD & Wallet Summary',
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
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Material(
                        borderRadius: BorderRadius.circular(12),
                        elevation: 3,
                        color: kPrimaryColor,
                        child: InkWell(
                          onTap: () {
                            // Add functionality for Grocery button
                          },
                          child: const SizedBox(
                            height: 40,
                            child: Center(
                              child: Text(
                                'Grocery',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Material(
                        borderRadius: BorderRadius.circular(12),
                        elevation: 3,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const FoodSummaryScreen(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  const begin = Offset(1.0, 0.0);
                                  const end = Offset.zero;
                                  const curve = Curves.ease;

                                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: const SizedBox(
                            height: 40,
                            child: Center(
                              child: Text(
                                'Food',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 38,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AdvancedSegment(
                  segments: {
                    'cod': 'COD Summary',
                    'wallet': 'Wallet Summary',
                  },
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  controller: _selectedSegment,
                  backgroundColor: kPrimaryColor,
                ),
              ),
              ValueListenableBuilder<String>(
                valueListenable: _selectedSegment,
                builder: (_, key, __) {
                  switch (key) {
                    case 'wallet':
                      return WalletWidget();
                    case 'cod':
                      return CODWidget();
                    default:
                      return CODWidget();
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
