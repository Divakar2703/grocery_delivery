import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_delivery_side/data/models/request/PhoneLoginRequestModel.dart';
import 'package:grocery_delivery_side/screens/login%20and%20Registration/ragistation.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_phone_login.dart';

import '../../constants.dart';
import '../../init_screen.dart';
import 'forget_password.dart';
import 'otp_screen.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {

  TextEditingController mobileController = TextEditingController();
  PhoneLoginViewModel phoneLoginViewModel = PhoneLoginViewModel();

  @override
  void initState() {
    super.initState();
  }

  void checkValidation(){
  if(mobileController.text.toString().length>=10){
    getUserId();
  }
  else{
    showToast('Please enter valid mobile no.!');
  }
  }
  void getUserId() {
    final phoneLoginRequestmodel = PhoneLoginRequestModel(
      phone: "9854652345",
    );

    phoneLoginViewModel.fetchPhoneLoginData(phoneLoginRequestmodel,context,);
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AspectRatio(
                  aspectRatio: 9 /11, // Adjust aspect ratio as needed
                  child: Image.asset(
                    'assets/images/boy3.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 32,horizontal: 16),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        kPrimaryColor,
                        Color(0xffa1cbfc),
                      ], // Add your desired gradient colors
                    ), borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Log In',
                          style: TextStyle(
                              fontFamily: 'Muli',
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset:
                            Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: mobileController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xff0C134F),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Enter Your Mobile No.',
                          contentPadding: EdgeInsets.all(4),
                          hintStyle: TextStyle(
                            fontFamily: 'Muli',

                            color: Color(0xff0C134F),
                          ),
                        ),
                      ),
                    ),

                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Container(
                    //   height: 45,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(12),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.blue.withOpacity(0.2),
                    //         spreadRadius: 3,
                    //         blurRadius: 7,
                    //         offset:
                    //         Offset(0, 3), // changes position of shadow
                    //       ),
                    //     ],
                    //   ),
                    //   child: TextField(
                    //     keyboardType: TextInputType.visiblePassword,
                    //     decoration: InputDecoration(
                    //       focusedBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //       prefixIcon: Icon(
                    //         Icons.key,
                    //         color: Color(0xff0C134F),
                    //       ),
                    //       fillColor: Colors.white,
                    //       filled: true,
                    //       hintText: 'Password',
                    //       contentPadding: EdgeInsets.all(4),
                    //       hintStyle: TextStyle(
                    //         fontFamily: 'Muli',
                    //         color: Color(0xff0C134F),
                    //       ),
                    //     ),
                    //   ),
                    // ),


                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: (){
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => OtpScreen()),
                        // );
                        checkValidation();
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
                            'Login',
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
                    SizedBox(
                      height: 5,
                    ),
                    Text('or',
                        style: TextStyle(color: Colors.white, fontSize: 13)),

                    SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Muli',
                                color: Colors.black87, fontSize: 12),
                          ),
                          TextSpan(
                              text: 'Sign Up',
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
                                MaterialPageRoute(builder: (context) => SignUp()),
                              );
                            },
                          ),


                          // Add any additional properties here

                          // Add more TextSpan widgets as needed
                        ],
                      ),
                    ),
                    // InkWell(
                    //   onTap: (){
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => ForgetPassword()),
                    //     );
                    //   },
                    //   child: Text(
                    //     'Forgot your password',
                    //     style: TextStyle(
                    //       fontFamily: 'Muli',
                    //       fontSize: 12,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.red,
                    //     ),
                    //   ),
                    // ),

                  ],
                ),
              ),

            ],
          ),
        ),
    );
  }
}
