import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_delivery_side/screens/profile/profile_edit.dart';

import '../../constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                   
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 16,right: 16,bottom: 24,top: 8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)
                        )
                      ),
                      child: Column(
                        children: [
                          // Add some spacing
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: SvgPicture.asset(
                                  "assets/icons/left-arrow-svgrepo-com.svg", // Replace with your SVG path
                                  height: 26,
                                  width: 26,
                                  color: kPrimaryColor,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              IconButton(
                                icon: SvgPicture.asset(
                                  "assets/icons/8666681_edit_icon.svg", // Replace with your SVG path
                                  height: 24,
                                  width: 24,
                                  color: kPrimaryColor,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ProfileEdit()),
                                  );
                                },
                              ),
                            ],
                          ),
                         // SizedBox(height: 15),
                          CircleAvatar(
                            backgroundColor: primaryColor, // Set your desired background color here
                            radius: 60, // Set the radius of the avatar
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
                          SizedBox(height: 10),
                          Text(
                            'Bhupendra thakur',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.black87,
                                fontFamily: "Muli",
                                fontWeight: FontWeight.w800
                            ),
                          ),
                          Text(
                            'ewqi448@gmail.com',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontFamily: "Muli",
                                fontWeight: FontWeight.w600
                            ),
                          ),
                
                
                
                        ],
                      ),
                    ),
                
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Status',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: "Muli",
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(height: 6),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.green
                                ),
                                child:  Text(
                                  'Active',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily: "Muli",
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Leave Status',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: "Muli",
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(height: 6),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.red
                                ),
                                child:  Text(
                                  'Active',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontFamily: "Muli",
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)
                      ),
                    child:  Column(
                      children: [
                        Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Name :',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: "Muli",
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'User id :',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: "Muli",
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Date of Joining :',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: "Muli",
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Phone :',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: "Muli",
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Leave Form Date :',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: "Muli",
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Leave To Date :',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: "Muli",
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: 5
                                  ),
                                  Text(
                                    'Bhupendra thakur',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700,
                                        fontFamily: "Muli",
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Bhupefowf',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700,
                                        fontFamily: "Muli",
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '03-10-2023 4:26 pm',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700,
                                        fontFamily: "Muli",
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '+9124302430',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700,
                                        fontFamily: "Muli",
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '30-11--0001',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700,
                                        fontFamily: "Muli",
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '+30-11--0001',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700,
                                        fontFamily: "Muli",
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address :',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: "Muli",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 30),
                            Expanded(
                              child: Text(
                                'bilaspur north , Wardha , Maharashtra , India , - 343553',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700,
                                  fontFamily: "Muli",
                                  fontWeight: FontWeight.w600,
                                ),
                             //   maxLines: 1, // Set maximum number of lines
                            //    overflow: TextOverflow.ellipsis, // Handle overflow by showing ellipsis
                              ),
                            ),
                          ],
                        )
                
                      ],
                    ),
                    ),
                    

                    Container(
                      margin: EdgeInsets.all(16),
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: SvgPicture.asset(
                              "assets/icons/logout-svgrepo-com-2.svg", // Replace with your SVG path
                              height: 20,
                              width: 18,
                              color: Colors.red,
                            ),
                            onPressed: () {
                            //  Navigator.of(context).pop();
                            },
                          ),
                          Text(
                            'LogOut',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: "Muli",
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                    )
                
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
