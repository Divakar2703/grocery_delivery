import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/data/models/request/verifyOtpRequestModel.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_verify_otp.dart';
import 'package:pinput/pinput.dart';
import '../../constants.dart';
import '../../data/models/request/PhoneLoginRequestModel.dart';
import '../../viewmodels/view_model_phone_login.dart';

class OtpScreen extends StatefulWidget {
  String? userId;
  String? mobile;

  OtpScreen({super.key, required this.userId, required this.mobile});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController pinputController = TextEditingController();
  VerifyOtpViewModel verifyOtpViewModel = VerifyOtpViewModel();

  PhoneLoginViewModel phoneLoginViewModel = PhoneLoginViewModel();
  bool _isLoading = false;

  @override
  void initState() {
    verifyOtpViewModel.userId = widget.userId.toString();
    verifyOtpViewModel.mobile = widget.mobile.toString();
    super.initState();
  }

  void verifyOtp() {
    String enteredOtp = pinputController.text.toString();
    if (enteredOtp.length == 6) {
      final verifyOtpReqModel =
          VerifyOtpRequestModel(userId: widget.userId, otp: enteredOtp);
      verifyOtpViewModel.fetchVerifyOtpData(
        verifyOtpReqModel,
        context,
      );
    }
  }

  Future<void> getUserId() async {
    setState(() {
      _isLoading = true;
    });

    final phoneLoginRequestmodel = PhoneLoginRequestModel(
      phone: widget.mobile,
    );

    await phoneLoginViewModel.fetchPhoneLoginData(
        phoneLoginRequestmodel, context);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(8, 155, 155, 1.0)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(245, 206, 207, 1.0),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Expanded(
                child: Container(
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(image: AssetImage("assets/images/v1.png")),

              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Verify OTP',
                      style: TextStyle(
                        color: Color(0xFF262626),
                        fontSize: 26,
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'We have send Otp to your Mobile No. ${widget.mobile}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Muli',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(22, 0, 0, 0),
                    child: Text(
                      'Enter OTP',
                      style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Muli',
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Pinput(
                  defaultPinTheme: defaultPinTheme,
                  controller: pinputController,
                  length: 6,
                  validator: (s) {
                    return s == '2222' ? null : '';
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: InkWell(
                  onTap: () {
                    verifyOtp();
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: const Center(
                      child: Text(
                        "VERIFY",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Muli',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Did'nt receve the verification OTP?",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontFamily: 'Muli',
                ),
              ),
              _isLoading
                  ? CircularProgressIndicator() // Don't show Resend OTP button while loading
                  : TextButton(
                      onPressed: () {
                        getUserId();
                      },
                      child: const Text(
                        "Resend OTP",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Muli',
                        ),
                      ),
                    ),
              // Padding(
              //   padding: const EdgeInsets.all(8),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Row(
              //         children: [
              //           Text(
              //             "Did'nt receve the verification OTP?",
              //             style: TextStyle(
              //               color: Colors.grey.shade700,
              //               fontFamily: 'Muli',
              //             ),
              //           ),
              //         ],
              //       ),
              //       Row(
              //         children: [
              //           TextButton(
              //             onPressed: () {
              //               // Navigator.of(context).push(
              //               //   MaterialPageRoute(
              //               //     builder: (context) => HomeScreen(),
              //               //   ),
              //               //    );
              //             },
              //             child: const Text(
              //               "\nResend OTP",
              //               style: TextStyle(
              //                 color: kPrimaryColor,
              //                 fontWeight: FontWeight.bold,
              //                 fontFamily: 'Muli',
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ))),
      ),
    );
  }
}
