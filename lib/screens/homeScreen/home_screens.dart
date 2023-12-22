import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/home_header.dart';
import 'components/order_card.dart';
import 'components/payments_card.dart';
import 'components/search_field.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Material(
              elevation: 4,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 3, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 3), // Changes position of shadow
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    HomeHeader(),
                    SizedBox(height: 10,),
                    SearchField(),
                  ],
                ),

              ),
            ),
            SizedBox(height: 10,),

            PaymentsCard(),
            OrderCard(),


          ],
        ),
      ),
    );
  }
}
