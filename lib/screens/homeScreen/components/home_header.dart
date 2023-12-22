import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import 'icon_btn_with_counter.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: primaryColor, // Set your desired background color here
          radius: 21, // Set the radius of the avatar
          foregroundColor: Colors.white, // Set the color of the border
          child: ClipOval(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white70, // Set the color of the border
                  width: 1.7, // Set the width of the border
                ),
              ),
              child: Image.asset(
                "assets/images/Profile Image.png", // Replace with your image asset path
                fit: BoxFit.cover, // Adjust the BoxFit property as needed
              ),
            ),
          ),
        ),


        const SizedBox(width: 8),

          const Text(
            'Delivery Boy',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
             fontFamily: "Muli",
              fontWeight: FontWeight.w600
            ),
          ),

      //  const SizedBox(width: 8),

       const Spacer(),
        IconBtnWithCounter(
          svgSrc: "assets/icons/Bell.svg",
          numOfitem: 3,
          press: () {},
        ),
      ],
    );
  }
}
