import 'package:flutter/material.dart';

import '../../constants.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(width: 8,),
                      Text(
                        "Update your Profile",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24)
                )
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '   User Name *',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade800,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        hintText: 'Enter your Name',
                        hintStyle: TextStyle(
                          // Center align the hint text
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Colors.black, // Set border color here
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        '   User ID *',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade800,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        hintText: 'Enter your Id',
                        hintStyle: TextStyle(
                          // Center align the hint text
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Colors.black, // Set border color here
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        '   Phone Number *',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade800,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        hintText: 'Enter your Number',
                        hintStyle: TextStyle(
                          // Center align the hint text
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Colors.black, // Set border color here
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        '   Email ID *',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade800,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        hintText: 'Enter your Email Id',
                        hintStyle: TextStyle(
                          // Center align the hint text
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Colors.black, // Set border color here
                          ),
                        ),
                      ),
                    ),
                  ),




                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
              child: Row(
                children: [
                  Text(
                    "Address Details",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontFamily: "Muli",
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24)
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '   Address *',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade800,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        hintText: 'Enter your Address',
                        hintStyle: TextStyle(
                          // Center align the hint text
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Colors.black, // Set border color here
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        '   Pin Code *',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade800,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        hintText: 'Enter your Pin Code',
                        hintStyle: TextStyle(
                          // Center align the hint text
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Colors.black, // Set border color here
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        '   City *',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade800,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        hintText: 'Enter your City',
                        hintStyle: TextStyle(
                          // Center align the hint text
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Colors.black, // Set border color here
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        '   State *',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade800,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        hintText: 'Enter your state',
                        hintStyle: TextStyle(
                          // Center align the hint text
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Colors.black, // Set border color here
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        '   Country *',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade800,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        hintText: 'Enter your Country',
                        hintStyle: TextStyle(
                          // Center align the hint text
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Colors.black, // Set border color here
                          ),
                        ),
                      ),
                    ),
                  ),





                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
              child: Row(
                children: [
                  Text(
                    "Leave Details",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontFamily: "Muli",
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),


            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24)
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '   Form Date *',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade800,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        hintText: '01/02/2024',
                        hintStyle: TextStyle(
                          // Center align the hint text
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Colors.black, // Set border color here
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        '   To Date *',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade800,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        hintText: '01/02/2024',
                        hintStyle: TextStyle(
                          // Center align the hint text
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(
                            color: Colors.black, // Set border color here
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:kPrimaryColor, // Set the red background color for the button
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Add functionality for the button
                        // For example
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),







                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}
