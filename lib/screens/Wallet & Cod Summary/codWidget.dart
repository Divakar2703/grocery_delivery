
import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/screens/Wallet%20&%20Cod%20Summary/selectDateAndSearchDateWalletSummary.dart';
import 'package:grocery_delivery_side/screens/Wallet%20&%20Cod%20Summary/walletCard.dart';
import 'package:intl/intl.dart';
import '../../../../constants.dart';
import 'codCard.dart';


class CODWidget extends StatefulWidget {
  const CODWidget({super.key});

  @override
  State<CODWidget> createState() => _AllWidgetState();
}

class _AllWidgetState extends State<CODWidget> {



  List<String> items = ['1', '2', '3','4','5'];
  String? selectItem = '1';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.all(8),
            elevation: 3,
            child: Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xfff9f9f9),
              ),
              child: Column(
                children: [

                  SelectDateAndSearchDateWalletSummary(),

                  SizedBox(height: 5,),
                  Divider(
                    thickness: 1,
                  ),

                  SizedBox(height: 10,),

                  CODtCard(),

                  SizedBox(height: 10,),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
