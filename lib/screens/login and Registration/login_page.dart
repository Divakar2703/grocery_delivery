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
      phone: mobileController.text.toString(),
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Image(image: AssetImage("assets/images/d2.png")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Enter your mobile number\nto get OTP',
                      style: TextStyle(
                          fontFamily: 'Muli',
                          color: Colors.black87,
                          fontSize: 27,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),

                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(12),

                  ),
                  child:TextField(
                    controller: mobileController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),

                     prefixText:"+91 | ",
                     prefixIcon: Icon(Icons.person),

                     // suffixIcon: SizedBox(width: 8),
                      fillColor: kPrimaryLightColor,
                      filled: true,
                      hintText: 'Enter Your Mobile No.',
                    contentPadding: EdgeInsets.all(8),
                      hintStyle: TextStyle(
                        fontFamily: 'Muli',
                        color: Color(0xff0C134F),
                      ),
                    ),
                  )



                ),



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
                      color: kPrimaryColor,
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    height: 50,
                    child: Center(
                      child: Text(
                        'Get OTP',
                        style: TextStyle(
                          fontFamily: 'Muli',
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Muli',
                            color: Colors.black54,
                            fontSize: 12),
                      ),
                      TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                              fontFamily: 'Muli',
                              decoration: TextDecoration.underline,
                              color: Colors.black87,
                              fontSize: 13,
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

              ],
            ),
          ),
        ),
    );
  }
}
