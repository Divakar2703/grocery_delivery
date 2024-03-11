import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:grocery_delivery_side/screens/Wallet%20&%20Cod%20Summary/walletWidget.dart';

import '../../constants.dart';
import '../Orders/Componenets/All/all_widget.dart';
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


class WalletSummaryHomeScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<WalletSummaryHomeScreen> {

  final _selectedSegment = ValueNotifier('all');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'COD & Wallet Summary',
            style: TextStyle(color: Colors.white,
                fontFamily: 'Muli',
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
          ),
          backgroundColor: kPrimaryColor,

        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10,),
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
                      case 'cod': // Corrected the case label
                        return CODWidget(); // or replace with the appropriate widget for starred data
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