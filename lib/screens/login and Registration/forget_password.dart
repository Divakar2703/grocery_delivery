import 'package:flutter/material.dart';

import '../../constants.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Flexible(
            //     child: AspectRatio(
            //       aspectRatio: 10 / 12, // Adjust aspect ratio as needed
            //       child: Image.asset(
            //         'assets/images/b.png',
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              child: Image.asset(
                'assets/images/b.png',
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 16,horizontal: 8),
             // margin:EdgeInsets.all(8),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      kPrimaryColor,
                      Color(0xffa1cbfc),
                    ], // Add your desired gradient colors
                  ), borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16)
              )
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Forget\nPassword',
                        style: TextStyle(
                            fontFamily: 'Muli',
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        'Mobile No*',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: 'Muli',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0), // Container border radius
                    ),
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Your mobile no.',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Muli',
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue, // TextField border color when focused
                            width: 2.0, // TextField border width when focused
                          ),
                          borderRadius: BorderRadius.circular(10.0), // TextField border radius when focused
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, // TextField border color when not focused
                            width: 1.0, // TextField border width when not focused
                          ),
                          borderRadius: BorderRadius.circular(10.0), // TextField border radius when not focused
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      ),
                    ),
                  ),


                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => InitScreen()),
                      // );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xffebf4f5),
                            Color(0xffb5c6e0)
                          ], // Add your desired gradient colors
                        ),
                        border: Border.all(color: Colors.white38),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      height: 40,
                      width: 270,
                      child: Center(
                        child: Text(
                          'Change password',
                          style: TextStyle(
                            fontFamily: 'Muli',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
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
