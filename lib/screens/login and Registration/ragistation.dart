import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../init_screen.dart';
import 'login_page.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Flexible(
              //     child: AspectRatio(
              //       aspectRatio: 22 / 13, // Adjust aspect ratio as needed
              //       child: Image.asset(
              //         'assets/images/g.png',
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                height: 180,
                child: Image.asset(
                  'assets/images/g.png',
                ),
              ),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      kPrimaryColor,
                      Color(0xffa1cbfc),
                    ], // Add your desired gradient colors
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Register Here',
                          style: TextStyle(
                              fontFamily: 'Muli',
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height:5,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Enter your Name*',
                              style: TextStyle(fontSize: 15,
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
                              hintText: 'Enter Your Name',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Muli',
                                fontSize: 14
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


                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text(
                              'Mobile No*',
                              style: TextStyle(fontSize: 15,
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
                              hintText: 'Enter Your Mobile No.',
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

                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text(
                              'Email Id*',
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
                              hintText: 'Enter Your Email Id',
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

                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text(
                              'Pin Code*',
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
                              hintText: 'Enter Your Pin Code',
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

                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text(
                              'Address*',
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
                              hintText: 'Enter Your Address',
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => InitScreen()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF439CFB),
                                  Color(0xFFD8E5F5)
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
                                'Save',
                                style: TextStyle(
                                  fontFamily: 'Muli',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('or',
                            style: TextStyle(color: Colors.white, fontSize: 13,fontFamily: 'Muli',)),

                        SizedBox(
                          height: 5,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'You have an account?',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Muli',
                                    color: Colors.black87, fontSize: 12),
                              ),
                              TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                      fontFamily: 'Muli',
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginUser()),
                                  );
                                },
                              ),


                              // Add any additional properties here

                              // Add more TextSpan widgets as needed
                            ],
                          ),
                        )
                      ],
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
