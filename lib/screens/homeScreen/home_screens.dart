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
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 24),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 3), // Changes position of shadow
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    HomeHeader(),
                    SizedBox(height: 15,),
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
