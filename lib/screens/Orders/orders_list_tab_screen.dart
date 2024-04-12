import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'Componenets/All/orders_list_screen.dart';
import 'Componenets/Cancelled/Cancelled_widget.dart';
import 'Componenets/Delivered/delivered_widget.dart';
import 'Componenets/Reject/rejectWidget.dart';
import 'Componenets/Return/returnWidget.dart';
import 'Componenets/Shipping/shippingWidget.dart';

class OrderScreenNew extends StatefulWidget {
  const OrderScreenNew({Key? key}) : super(key: key);

  @override
  State<OrderScreenNew> createState() => _OrderScreenNewState();
}

class _OrderScreenNewState extends State<OrderScreenNew> {
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
      body: SafeArea(
        child: DefaultTabController(
          length: 6,
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
                    text: "Requested Orders",
                  ),
                  Tab(
                    text: "Assign Orders",
                  ),
                  Tab(
                    text: "Delivered",
                  ),
                  Tab(
                    text: "Return",
                  ),
                  Tab(
                    text: "Reject",
                  ),
                  Tab(
                    text: "Cancel Order",
                  ),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: <Widget>[
                    AllWidget(type: "Requested Orders",),
                    AllWidget(type: "Assign Orders",),
                    AllWidget(type: "Delivered",),
                    AllWidget(type: "Return",),
                    AllWidget(type: "Reject",),
                    AllWidget(type: "Cancel Order",),
                    // ShippingWidget(),
                    // DeliveredWidget(),
                    // ReturnWidget(),
                    // RejectWidget(),
                    // CancelledWidget(),
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
