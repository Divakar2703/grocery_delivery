import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/constants.dart';

import 'components/order_date.dart';
import 'components/order_time.dart';

class OrderNowScreen extends StatefulWidget {
  const OrderNowScreen({super.key});

  @override
  State<OrderNowScreen> createState() => _OrderNowScreenState();
}

class _OrderNowScreenState extends State<OrderNowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40,left: 16,right: 16,bottom: 16),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(
                    "Order Now",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: "Muli",
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),

            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)
                ),
              ),
              child: Column(
                children:  [
                  SizedBox(height: 10,),
                  OrderDate(),
                  OrderTime(),
                  OrderTime()

                ],
              ),
            ),
          ],
        ),
      ),


    );
  }
}
