import 'package:flutter/material.dart';

import '../../constants.dart';
import '../homeScreen/components/home_header.dart';
import 'chat.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40,left: 16,right: 16,bottom: 16),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(
                    "Seller Chat's",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: "Muli",
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
        
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24)
                ),
              ),
              child: Column(
                children:  [
                  Container(
                    height: 42,
                    margin:EdgeInsets.all(8) ,
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.black54,
                          ),
                          hintText: "Search here...",
                          hintStyle: TextStyle(color: Colors.black54),
                          contentPadding: EdgeInsets.only(left: 16), // Adjust left padding
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54),
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54),
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
        
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
        
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                              fontFamily: "Muli",
                              color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
    
    
    
    
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
    
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
    
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
    
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
    
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
    
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
    
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
    
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
    
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
    
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
    
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage( "assets/images/Profile Image.png",),
                          ),
                          SizedBox(width: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vivek Sharma",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Muli",
                                ),
                              ),
    
                            ],
                          ),
                          Spacer(),
                          Text(
                            "10 min",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Muli",
                                color: Colors.grey.shade700
    
                            ),
                          ),
                        ],
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
