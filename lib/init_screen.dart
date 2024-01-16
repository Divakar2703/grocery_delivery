import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_delivery_side/screens/Orders/orders_screen.dart';
import 'package:grocery_delivery_side/screens/chats/chat_list.dart';
import 'package:grocery_delivery_side/screens/homeScreen/home_screens.dart';
import 'package:grocery_delivery_side/screens/order_now/order_now_screen.dart';

import 'constants.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    // Add your other screens here
    ChatList(),
    OrdersScreen(), // Placeholder for other screens
    OrderNowScreen(),
    // Placeholder for other screens
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          _buildNavItem("assets/icons/Shop Icon.svg"),
          _buildNavItem("assets/icons/Chat bubble Icon.svg"),
          _buildNavItem("assets/icons/shoping_card.svg"),
          _buildNavItem("assets/icons/Settings.svg"),
       //  _buildNavItem("assets/icons/User Icon.svg"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        index: _currentIndex,
        height: 58,
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
        color: Colors.white, // Change colors as needed
      ),
      body: _screens[_currentIndex],
    );
  }

  Widget _buildNavItem(String iconPath) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6,horizontal: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            color: _currentIndex == 0 ? kPrimaryColor : kPrimaryColor,
          ),

        ],
      ),
    );
  }
}
