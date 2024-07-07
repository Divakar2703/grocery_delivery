import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key,}) : super(key: key);


  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implement onTap functionality if needed
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 37,
                    backgroundColor: Color(0xfff4f5f7),
                    child: SvgPicture.asset(Constants.apple),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Rona",
                    style: TextStyle(
                      fontSize: 15, // Adjust font size as needed
                      fontWeight: FontWeight.w600,
                      color: Colors.black87
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10,),
              Column(
                children: [
                  CircleAvatar(
                    radius: 37,
                    backgroundColor: Color(0xfff4f5f7),
                    child: SvgPicture.asset(Constants.broccoli),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Vegetables",
                    style: TextStyle(
                        fontSize: 15, // Adjust font size as needed
                        fontWeight: FontWeight.w600,
                        color: Colors.black87
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10,),
              Column(
                children: [
                  CircleAvatar(
                    radius: 37,
                    backgroundColor: Color(0xfff4f5f7),
                    child: SvgPicture.asset(Constants.cheese),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Cheeses",
                    style: TextStyle(
                        fontSize: 15, // Adjust font size as needed
                        fontWeight: FontWeight.w600,
                        color: Colors.black87
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  CircleAvatar(
                    radius: 37,
                    backgroundColor: Color(0xfff4f5f7),
                    child: SvgPicture.asset(Constants.meat),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Meat",
                    style: TextStyle(
                        fontSize: 15, // Adjust font size as needed
                        fontWeight: FontWeight.w600,
                        color: Colors.black87
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10,),
              Column(
                children: [
                  CircleAvatar(
                    radius: 37,
                    backgroundColor: Color(0xfff4f5f7),
                    child: SvgPicture.asset(Constants.apple),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Rona",
                    style: TextStyle(
                        fontSize: 15, // Adjust font size as needed
                        fontWeight: FontWeight.w600,
                        color: Colors.black87
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


