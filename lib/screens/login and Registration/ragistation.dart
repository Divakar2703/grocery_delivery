import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_register.dart';
import '../../constants.dart';
import '../../data/models/request/registerRequestModel.dart';
import '../../init_screen.dart';
import 'login_page.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  RegisterViewModel registerViewModel = RegisterViewModel();

  @override
  void initState() {
    // TODO: implement initState
    // getRegisterData();
  }

  void getRegisterData() {
    registerViewModel.mobile=mobileController.text.toString();
    final registerRequestModel = RegisterRequestModel(
      name: nameController.text.toString(),
      mobileNo: mobileController.text.toString(),
      emailId: emailController.text.toString(),
      pinCode: pinCodeController.text.toString(),
      address: addressController.text.toString(),
    );

    print("==================clicked================");
    registerViewModel.fetchRegisterData(registerRequestModel,context);
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
    return  Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    getRegisterData();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage("assets/images/d1.png"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                        onTap:(){
                          getRegisterData();
                  },
                              child: Text(
                                'Register Here',
                                style: TextStyle(
                                    fontFamily: 'Muli',
                                    color: Colors.black87,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height:20,),
                        Row(
                          children: [
                            Text(
                              'Enter your Name*',
                              style: TextStyle(fontSize: 16,
                                  color: Colors.black87,
                                fontFamily: 'Muli',

                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0), // Container border radius
                          ),
                          height: 50,
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: 'Enter Your Name',
                              hintStyle: TextStyle(
                                fontFamily: 'Muli',
                                color: Color(0xff0C134F),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: kPrimaryColor, // TextField border color when focused
                                  width: 1.0, // TextField border width when focused
                                ),
                                borderRadius: BorderRadius.circular(10.0), // TextField border radius when focused
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black87, // TextField border color when not focused
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
                              style: TextStyle(fontSize: 16,
                                  color: Colors.black87,
                                fontFamily: 'Muli',
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0), // Container border radius
                          ),
                          height: 50,
                          child: TextField(
                            controller: mobileController,
                            decoration: InputDecoration(
                              hintText: ' +91 | Enter Your mobile No.',
                              hintStyle: TextStyle(
                                fontFamily: 'Muli',
                                color: Color(0xff0C134F),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: kPrimaryColor, // TextField border color when focused
                                  width: 1.0, // TextField border width when focused
                                ),
                                borderRadius: BorderRadius.circular(10.0), // TextField border radius when focused
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black87, // TextField border color when not focused
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
                                  fontSize: 16,
                                  color: Colors.black87,
                                fontFamily: 'Muli',
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0), // Container border radius
                          ),
                          height: 50,
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Enter Your Email Id',
                              hintStyle: TextStyle(
                                fontFamily: 'Muli',
                                color: Color(0xff0C134F),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: kPrimaryColor, // TextField border color when focused
                                  width: 1.0, // TextField border width when focused
                                ),
                                borderRadius: BorderRadius.circular(10.0), // TextField border radius when focused
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black87, // TextField border color when not focused
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
                                  fontSize: 16,
                                  color: Colors.black87,
                                fontFamily: 'Muli',
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0), // Container border radius
                          ),
                          height: 50,
                          child: TextField(
                            controller: pinCodeController,
                            decoration: InputDecoration(
                              hintText: 'Enter Your Pin Code',
                              hintStyle: TextStyle(
                                fontFamily: 'Muli',
                                color: Color(0xff0C134F),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: kPrimaryColor, // TextField border color when focused
                                  width: 1.0, // TextField border width when focused
                                ),
                                borderRadius: BorderRadius.circular(10.0), // TextField border radius when focused
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black87, // TextField border color when not focused
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
                                  fontSize: 16,
                                  color: Colors.black87,
                                fontFamily: 'Muli',
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0), // Container border radius
                          ),
                          height: 50,
                          child: TextField(
                            controller: addressController,
                            decoration: InputDecoration(
                              hintText: 'Enter Your Address',
                              hintStyle: TextStyle(
                                fontFamily: 'Muli',
                                color: Color(0xff0C134F),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: kPrimaryColor, // TextField border color when focused
                                  width: 1.0, // TextField border width when focused
                                ),
                                borderRadius: BorderRadius.circular(10.0), // TextField border radius when focused
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black87, // TextField border color when not focused
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
                        Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            border: Border.all(color: Colors.white38),
                           borderRadius: BorderRadius.circular(12)
                          ),
                          height: 50,
                          child: Center(
                            child: InkWell(
                              onTap: (){
                                getRegisterData();
                              },
                              child: Text(
                                'Save',
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
                        height: 10,
                      ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'You have an account?',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Muli',
                                    color: Colors.black54,
                                    fontSize: 12),
                              ),
                              TextSpan(
                                  text: 'Login',
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
                                    MaterialPageRoute(builder: (context) => LoginUser()),
                                  );
                                },
                              ),


                              // Add any additional properties here

                              // Add more TextSpan widgets as needed
                            ],
                          ),
                        ),


                        SizedBox(
                          height: MediaQuery.of(context).viewInsets.bottom + 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
