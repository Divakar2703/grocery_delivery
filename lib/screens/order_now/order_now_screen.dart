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
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Order Now',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: "Muli",
              fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(18),
          child: Column(
            children: [
              OrderDate(),
        
              SizedBox(height: 20,),
        
              OrderTime(),
            ],
          ),
        ),
      ),
    );
  }
}
