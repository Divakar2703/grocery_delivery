import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_register.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    // getRegisterData();
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
    );

    print("==================clicked================");
    await registerViewModel.fetchRegisterData(registerRequestModel, context);

    setState(() {
      _isLoading = false;
    });
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
                GestureDetector(
                  onTap: (){
                    getRegisterData();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
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
                        onTap:(){
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
            
            
                              // Add any additional properties here
            
                              // Add more TextSpan widgets as needed
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
        ),
    );
  }
}
