import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'Componenets/All/all_widget.dart';
import 'Componenets/Cancelled/Cancelled_widget.dart';
import 'Componenets/Delivered/delivered_widget.dart';
import 'Componenets/Reject/rejectWidget.dart';
import 'Componenets/Return/returnWidget.dart';
import 'Componenets/Shipping/shippingWidget.dart';

class OrderScreenNew extends StatefulWidget {
  const OrderScreenNew({super.key});

  @override
  State<OrderScreenNew> createState() => _OrderScreenNewState();
}

class _OrderScreenNewState extends State<OrderScreenNew> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'All Ordered List',
          style: TextStyle(color: Colors.white,
              fontFamily: 'Muli',
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),
        ),
        backgroundColor: kPrimaryColor,

      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 6,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              ButtonsTabBar(
                height: 35,
                buttonMargin: EdgeInsets.symmetric(horizontal: 16),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                backgroundColor: kPrimaryColor,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: Colors.black,fontFamily: "Muli"),
                labelStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: "Muli"),
                tabs: [
                  Tab(
                   // icon: Icon(Icons.directions_car),
                    text: "All",
                  ),
                  Tab(
                  //  icon: Icon(Icons.directions_transit),
                    text: "Shipping",
                  ),
                  Tab(
                  //  icon: Icon(Icons.directions_car),
                    text: "Delivered ",
                  ),
                  Tab(
                //    icon: Icon(Icons.directions_transit),
                    text: "Return ",
                  ),
                  Tab(
                   // icon: Icon(Icons.directions_car),
                    text: "Reject ",
                  ),
                  Tab(
                //    icon: Icon(Icons.directions_transit),
                    text: "Cancel Order ",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    AllWidget(),
                    ShippingWidget(),
                    DeliveredWidget(),
                    ReturnWidget(),
                    RejectWidget(),
                    CancelledWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
