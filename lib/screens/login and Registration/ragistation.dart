import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_register.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../constants.dart';
import '../../data/models/request/registerRequestModel.dart';
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
  bool _isLoading = false;

  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    _getLocationPermission();
  }

  void _getLocationPermission() async {
    PermissionStatus permission = await Permission.location.request();
    if (permission.isGranted) {
      _getCurrentLocation();
    }
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
  }

  void getRegisterData() async {
    setState(() {
      _isLoading = true;
    });

    final registerRequestModel = RegisterRequestModel(
      name: nameController.text.toString(),
      mobileNo: mobileController.text.toString(),
      emailId: emailController.text.toString(),
      pinCode: pinCodeController.text.toString(),
      address: addressController.text.toString(),
      latitude: latitude != null ? latitude!.toString() : "",
      longitude: longitude != null ? longitude!.toString() : "",
    );

    print("==================clicked================");
    await registerViewModel.fetchRegisterData(registerRequestModel, context);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          reverse: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        getRegisterData();
                      },
                      child: Column(
                        children: [
                          const SizedBox(height: 20,),
                          const Image(
                            image: AssetImage("assets/images/d1.png"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  getRegisterData();
                                },
                                child: const Text(
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
                          const SizedBox(height:20,),
                          const SizedBox(height:20,),
                          const Row(
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
                          // Name TextField
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0), // Container border radius
                            ),
                            height: 50,
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: 'Enter Your Name',
                                hintStyle: const TextStyle(
                                  fontFamily: 'Muli',
                                  color: Color(0xff0C134F),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: kPrimaryColor, // TextField border color when focused
                                    width: 1.0, // TextField border width when focused
                                  ),
                                  borderRadius: BorderRadius.circular(10.0), // TextField border radius when focused
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black87, // TextField border color when not focused
                                    width: 1.0, // TextField border width when not focused
                                  ),
                                  borderRadius: BorderRadius.circular(10.0), // TextField border radius when not focused
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                              ),
                            ),
                          ),

                          const SizedBox(height: 5,),
                          // Mobile No TextField
                          const Row(
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
                              keyboardType: TextInputType.number,
                              controller: mobileController,
                              decoration: InputDecoration(
                                hintText: ' +91 | Enter Your mobile No.',
                                hintStyle: const TextStyle(
                                  fontFamily: 'Muli',
                                  color: Color(0xff0C134F),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: kPrimaryColor, // TextField border color when focused
                                    width: 1.0, // TextField border width when focused
                                  ),
                                  borderRadius: BorderRadius.circular(10.0), // TextField border radius when focused
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black87, // TextField border color when not focused
                                    width: 1.0, // TextField border width when not focused
                                  ),

                                  borderRadius: BorderRadius.circular(10.0), // TextField border radius when not focused
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                              ),
                            ),
                          ),

                          const SizedBox(height: 5,),
                          // Email TextField
                          const Row(
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
                                hintStyle: const TextStyle(
                                  fontFamily: 'Muli',
                                  color: Color(0xff0C134F),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: kPrimaryColor, // TextField border color when focused
                                    width: 1.0, // TextField border width when focused
                                  ),
                                  borderRadius: BorderRadius.circular(10.0), // TextField border radius when focused
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black87, // TextField border color when not focused
                                    width: 1.0, // TextField border width when not focused
                                  ),

                                  borderRadius: BorderRadius.circular(10.0), // TextField border radius when not focused
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                              ),
                            ),
                          ),

                          const SizedBox(height: 5,),
                          // Pin Code TextField
                          const Row(
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
                                hintStyle: const TextStyle(
                                  fontFamily: 'Muli',
                                  color: Color(0xff0C134F),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: kPrimaryColor, // TextField border color when focused
                                    width: 1.0, // TextField border width when focused
                                  ),
                                  borderRadius: BorderRadius.circular(10.0), // TextField border radius when focused
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black87, // TextField border color when not focused
                                    width: 1.0, // TextField border width when not focused
                                  ),

                                  borderRadius: BorderRadius.circular(10.0), // TextField border radius when not focused
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                              ),
                            ),
                          ),

                          const SizedBox(height: 5,),
                          // Address TextField
                          const Row(
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
                                hintStyle: const TextStyle(
                                  fontFamily: 'Muli',
                                  color: Color(0xff0C134F),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: kPrimaryColor, // TextField border color when focused
                                    width: 1.0, // TextField border width when focused
                                  ),
                                  borderRadius: BorderRadius.circular(10.0), // TextField border radius when focused
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black87, // TextField border color when not focused
                                    width: 1.0, // TextField border width when not focused
                                  ),

                                  borderRadius: BorderRadius.circular(10.0), // TextField border radius when not focused
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          const SizedBox(height: 20),
                          // Save Button
                          _isLoading
                              ? const CircularProgressIndicator()
                              : Container(
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
                                child: const Text(
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
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Login Link
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'You have an account?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Muli',
                                      color: Colors.black54,
                                      fontSize: 12),
                                ),
                                TextSpan(
                                  text: 'Login',
                                  style: const TextStyle(
                                      fontFamily: 'Muli',
                                      decoration: TextDecoration.underline,
                                      color: Colors.black87,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const LoginUser()),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
