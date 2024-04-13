import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_delivery_side/data/models/request/PhoneLoginRequestModel.dart';
import 'package:grocery_delivery_side/screens/login%20and%20Registration/ragistation.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_phone_login.dart';
import '../../constants.dart';


class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  TextEditingController mobileController = TextEditingController();
  PhoneLoginViewModel phoneLoginViewModel = PhoneLoginViewModel();
  bool _isLoading = false;

  void checkValidation() {
    if (mobileController.text.toString().length >= 10) {
      getUserId();
    } else {
      showToast('Please enter valid mobile no.!');
    }
  }

  Future<void> getUserId() async {
    setState(() {
      _isLoading = true;
    });

    final phoneLoginRequestmodel = PhoneLoginRequestModel(
      phone: mobileController.text.toString(),
    );

    await phoneLoginViewModel.fetchPhoneLoginData(phoneLoginRequestmodel, context);

    setState(() {
      _isLoading = false;
    });
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
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Image(image: AssetImage("assets/images/d2.png")),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Enter your mobile number to get OTP',
                        style: TextStyle(
                            fontFamily: 'Muli',
                            color: Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(12),
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
                      prefixText: "+91 | ",
                      prefixIcon: const Icon(Icons.person),
                      fillColor: kPrimaryLightColor,
                      filled: true,
                      hintText: 'Enter Your Mobile No.',
                      contentPadding: const EdgeInsets.all(8),
                      hintStyle: const TextStyle(
                        fontFamily: 'Muli',
                        color: Color(0xff0C134F),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                _isLoading
                    ? const CircularProgressIndicator() // Show progress indicator when loading
                    : InkWell(
                  onTap: () {
                    checkValidation();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        border: Border.all(color: Colors.white38),
                        borderRadius: BorderRadius.circular(12)),
                    height: 50,
                    child: const Center(
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
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Muli',
                            color: Colors.black54,
                            fontSize: 12),
                      ),
                      TextSpan(
                        text: 'Sign Up',
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
                              MaterialPageRoute(builder: (context) => const SignUp()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
