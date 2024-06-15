import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/new_init_screen.dart';
import '../../constants.dart';
import 'Componenets/All/orders_list_screen.dart';
import 'food_orders/food_order_list_tab_screen.dart';

class OrderScreenNew extends StatefulWidget {
  const OrderScreenNew({Key? key}) : super(key: key);

  @override
  State<OrderScreenNew> createState() => _OrderScreenNewState();
}

class _OrderScreenNewState extends State<OrderScreenNew> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => NewInitScrren()),
              (Route<dynamic> route) => false,
        );
        return false;
      },
      child: Scaffold(
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
                const SizedBox(height: 8),
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
                                  pageBuilder: (context, animation, secondaryAnimation) =>
                                  const OrderScreenNewFood(),
                                  transitionsBuilder:
                                      (context, animation, secondaryAnimation, child) {
                                    const begin = Offset(1.0, 0.0);
                                    const end = Offset.zero;
                                    const curve = Curves.ease;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));

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
                const Divider(thickness: 1),
                const SizedBox(height: 8),
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
                    Tab(text: "Requested Orders"),
                    Tab(text: "Assign Orders"),
                    Tab(text: "Delivered"),
                    Tab(text: "Return"),
                    Tab(text: "Reject"),
                    Tab(text: "Cancel Order"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      AllWidget(type: "Requested Orders"),
                      AllWidget(type: "Assign Orders"),
                      AllWidget(type: "Delivered"),
                      AllWidget(type: "Return"),
                      AllWidget(type: "Reject"),
                      AllWidget(type: "Cancel Orders"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
