import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_delivery_side/screens/Orders/orders_screen.dart';
import 'package:grocery_delivery_side/screens/homeScreen/home_screens.dart';

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
    Placeholder(),
    OrdersScreen(), // Placeholder for other screens
    Placeholder(), // Placeholder for other screens
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          _buildNavItem("assets/icons/Shop Icon.svg", "Shop"),
          _buildNavItem("assets/icons/Chat bubble Icon.svg", "Chat"),
          _buildNavItem("assets/icons/shoping_card.svg", "Cart"),
          _buildNavItem("assets/icons/User Icon.svg", "User"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        index: _currentIndex,
        height: 55,
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
        color: kPrimaryColor, // Change colors as needed
      ),
      body: _screens[_currentIndex],
    );
  }

  Widget _buildNavItem(String iconPath, String label) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            color: _currentIndex == 0 ? Colors.white70 : kPrimaryLightColor,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: _currentIndex == 0 ? Colors.white70 : kPrimaryLightColor,
            ),
          ),
        ],
      ),
    );
  }
}
