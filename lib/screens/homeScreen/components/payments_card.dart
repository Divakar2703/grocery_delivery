import 'package:flutter/material.dart';

import '../../map/delivery_loc_tracking.dart';

class HomeCardView extends StatelessWidget {

  final String cardTitle;
  final String cardCount;
  final String cardImage;


  const HomeCardView({
    super.key, required this.cardTitle, required this.cardCount, required this.cardImage,
  });


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          height: 90,
        //  margin: EdgeInsets.only(right: 16), // Add margin between items
          decoration: BoxDecoration(
         //   color: Color(0xFFF87A6C),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    cardTitle,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                  ),
                  Text(
                    cardCount,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
                width: 70,
                child: Image.asset(
                  cardImage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
