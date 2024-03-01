import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_delivery_side/data/models/request/sendOtpRequestModel.dart';
import 'package:grocery_delivery_side/data/models/request/verifyOtpRequestModel.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_send_otp.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_verify_otp.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../data/processResponse/status.dart';
import '../../init_screen.dart';

class OtpScreen extends StatefulWidget {
  String? userId;
  String? mobile;

  OtpScreen({super.key, required this.userId, required this.mobile});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  SendOtpViewModel sendOtpViewModel = SendOtpViewModel();
  TextEditingController pinputController = TextEditingController();
  VerifyOtpViewModel verifyOtpViewModel = VerifyOtpViewModel();
  String? otp = '';

  @override
  void initState() {
    final sendOtpReqModel = SendOtpRequestModel(userId: widget.userId);
    sendOtpViewModel.fetchSendOtpData(
      sendOtpReqModel,
      context,
    );

    verifyOtpViewModel.userId = widget.userId.toString();
    verifyOtpViewModel.mobile = widget.mobile.toString();
    // getOtp();
    super.initState();
  }

  void getOtp() {
    otp = sendOtpViewModel.sendOtpData.data?.otp.toString();
    Fluttertoast.showToast(
      msg: otp.toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
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
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(211, 89, 92, 1.0)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(245, 206, 207, 1.0),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ChangeNotifierProvider<SendOtpViewModel>(
            create: (BuildContext context) => sendOtpViewModel,
            child: Consumer<SendOtpViewModel>(builder: (context, value, _) {
              switch (value.sendOtpData.status ?? "") {
                case Status.LOADING:
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                case Status.ERROR:
                  return const Text("Hello i am waiting error on Home page");
                case Status.COMPLETED:
                  return Expanded(
                      child: Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(image: AssetImage("assets/images/v1.png")),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
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
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'We have send Otp to your Mobile No.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
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
                            controller: pinputController,
                            length: 6,
                            validator: (s) {
                              return s == '2222' ? null : '';
                            },
                            pinputAutovalidateMode:
                                PinputAutovalidateMode.onSubmit,
                            showCursor: true,
                            onCompleted: (pin) => print(pin),
                          ),
                        ),
                        SizedBox(
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
                              child: Center(
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
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Did'nt receve the verification OTP?",
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontFamily: 'Muli',
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) => HomeScreen(),
                                      //   ),
                                      //    );
                                    },
                                    child: Text(
                                      "Resnd OTP",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Muli',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ));
              }

              return Container();
            }),
          ),
        ]),
      ),
    );
  }
}
