import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/screens/Orders/Componenets/All/all_widget.dart';
import '../../constants.dart';
import 'Componenets/Cancelled/Cancelled_widget.dart';
import 'Componenets/Delivered/delivered_widget.dart';
import 'Componenets/Pending/pending_widget.dart';



class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar:  AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Ordered List',
            style: TextStyle(color: Colors.white,
              fontFamily: 'Muli',
              fontSize: 20
            ),
          ),
          backgroundColor: kPrimaryColor,

        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'All',),
                Tab(text: 'Pending'),
                Tab(text: 'Delivered'),
                Tab(text: 'Cancelled'),

              ],
              isScrollable: true,
              labelColor: kPrimaryColor,

              unselectedLabelColor: Colors.grey,
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[


                  AllWidget(),
                  PendingWidget(),
                  DeliveredWidget(),
                  CancelledWidget(),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
