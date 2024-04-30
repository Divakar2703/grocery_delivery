import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/constants.dart';

class ReturnOrderBottomSheet extends StatefulWidget {
  String? tappedButton;
  final String payId;
  final String orderId;
  final Function(BuildContext context, String payId, String orderId, String comment) cancelOrderCallback;
  final Function(BuildContext context, String payId, String comment) rejectOrderCallback;
  final Function(BuildContext context, String payId) returnOrderCallback;
  final Function(BuildContext context, String payId, String comment, String otp) returnOrderVerifyOtpCallback;
  final Function(BuildContext context, String payId) deliverOrderCallback;
  final Function(BuildContext context, String payId, String otp) deliverOrderVerifyOtpCallback;

  ReturnOrderBottomSheet({
    this.tappedButton,
    required this.payId,
    required this.rejectOrderCallback,
    required this.returnOrderCallback,
    required this.returnOrderVerifyOtpCallback,
    required this.cancelOrderCallback, required this.orderId,
    required this.deliverOrderCallback, required this.deliverOrderVerifyOtpCallback,
  });

  @override
  State<ReturnOrderBottomSheet> createState() => _ReturnOrderBottomSheetState();
}

class _ReturnOrderBottomSheetState extends State<ReturnOrderBottomSheet> {
  late TextEditingController otpController;
  late TextEditingController reasonController;
  bool _showProgressDialog = false;
  bool _showOtpField = false;

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
    reasonController = TextEditingController();
  }

  @override
  void dispose() {
    otpController.dispose();
    reasonController.dispose();
    super.dispose();
  }

  void hideProgressDialog() {
    setState(() {
      _showProgressDialog = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
          child: Scaffold(
            backgroundColor: const Color(0xFFFAFBFB),
            appBar: AppBar(
              elevation: 4.0,
              centerTitle: true,
              automaticallyImplyLeading: false,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
              title: Text(
                "${widget.tappedButton}",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.grey
                        )
                    ),
                    child: TextField(
                      controller: reasonController,
                      decoration: InputDecoration(
                        hintText: "Reason for ${widget.tappedButton}",
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                        contentPadding: const EdgeInsets.only(left: 16),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showProgressDialog = true;
                      });
                      if (widget.tappedButton == 'Reject') {
                        String reason = reasonController.text;
                        widget.rejectOrderCallback(context, widget.payId, reason);
                        hideProgressDialog();
                        Navigator.pop(context);

                      } else if (widget.tappedButton == 'Return') {
                        widget.returnOrderCallback(context, widget.payId);
                        _showOtpField = true;
                        hideProgressDialog();
                      } else if (widget.tappedButton == 'Deliver') {
                        widget.deliverOrderCallback(context, widget.payId);
                        _showOtpField = true;
                        hideProgressDialog();
                      } else if (widget.tappedButton == 'Cancel') {
                        widget.cancelOrderCallback(context, reasonController.text,widget.orderId,widget.payId);
                        hideProgressDialog();
                        Navigator.pop(context);

                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 36,
                      width: 100,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(
                        widget.tappedButton == 'verifyOtp' ? 'Verify OTP' : widget.tappedButton!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: "Muli",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  if (widget.tappedButton == 'Return' || widget.tappedButton == 'Deliver')
                    Column(
                      children: [
                        // const Text(
                        //   "OTP",
                        //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        // ),
                        const SizedBox(height: 10,),
                        if (_showOtpField)
                          Column(
                            children: [
                              Container(
                                height: 66,
                                child: TextField(
                                  controller: otpController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 6,
                                  decoration: InputDecoration(
                                    hintText: "Enter OTP",
                                    hintStyle: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                    contentPadding: const EdgeInsets.only(left: 16),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.black54),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.black54),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showProgressDialog = true;
                                  });
                                  if (widget.tappedButton == 'Return') {
                                    if (_showOtpField) {
                                      String otp = otpController.text;
                                      String comment = reasonController.text;
                                      widget.returnOrderVerifyOtpCallback(context, widget.payId, comment, otp);
                                      hideProgressDialog();
                                      Navigator.pop(context);
                                    } else {
                                      // If OTP field is not shown yet, toggle its visibility
                                      setState(() {
                                        _showOtpField = true;
                                        _showProgressDialog = false;
                                      });
                                    }
                                  } else if (widget.tappedButton == 'Deliver') {
                                    if (_showOtpField) {
                                      String otp = otpController.text;
                                      widget.deliverOrderVerifyOtpCallback(context, widget.payId, otp);
                                      hideProgressDialog();
                                      Navigator.pop(context);
                                    } else {
                                      // If OTP field is not shown yet, toggle its visibility
                                      setState(() {
                                        _showOtpField = true;
                                        _showProgressDialog = false;
                                      });
                                    }
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 36,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                   'Verify OTP',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: "Muli",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  if (_showProgressDialog)
                    const CircularProgressIndicator(), // Show the progress dialog if needed
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
