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

  ReturnOrderBottomSheet({
    this.tappedButton,
    required this.payId,
    required this.rejectOrderCallback,
    required this.returnOrderCallback,
    required this.returnOrderVerifyOtpCallback,
    required this.cancelOrderCallback, required this.orderId,
  });

  @override
  State<ReturnOrderBottomSheet> createState() => _ReturnOrderBottomSheetState();
}

class _ReturnOrderBottomSheetState extends State<ReturnOrderBottomSheet> {
  late TextEditingController otpController;
  late TextEditingController reasonController;
  bool _showProgressDialog = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: 320,
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
                  if (widget.tappedButton == 'Return')
                    Column(
                      children: [
                        const Text(
                          "OTP",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          height: 36,
                          child: TextField(
                            controller: otpController,
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
                      ],
                    ),
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
                  if (widget.tappedButton == 'Reject')
                    GestureDetector(
                      onTap: () {
                        _showProgressDialog = true;
                        setState(() {});
                        String reason = reasonController.text;
                        widget.rejectOrderCallback(context, widget.payId, reason);
                        // You should update the state based on the response from the function call to hide the progress dialog.
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 36,
                        width: 100,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Text('Reject',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: "Muli",
                          ),
                        ),
                      ),
                    ),
                  if (widget.tappedButton == 'Return')
                    GestureDetector(
                      onTap: () {
                        _showProgressDialog = true;
                        setState(() {});
                        widget.returnOrderCallback(context, widget.payId);
                        widget.tappedButton = "verifyOtp";
                        // You should update the state based on the response from the function call to hide the progress dialog.
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 36,
                        width: 100,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Text('Return',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: "Muli",
                          ),
                        ),
                      ),
                    ),
                  if (widget.tappedButton == 'Cancel')
                    GestureDetector(
                      onTap: () {
                        _showProgressDialog = true;
                        setState(() {});
                        widget.cancelOrderCallback(context, reasonController.text,widget.orderId,widget.payId);
                        },
                      child: Container(
                        alignment: Alignment.center,
                        height: 36,
                        width: 100,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Text('Return',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: "Muli",
                          ),
                        ),
                      ),
                    ),
                  if (widget.tappedButton == 'verifyOtp')
                    GestureDetector(
                      onTap: () {
                        _showProgressDialog = true;
                        setState(() {});
                        String otp = otpController.text;
                        String reason = reasonController.text;
                        widget.returnOrderVerifyOtpCallback(context, widget.payId, reason, otp);
                        // You should update the state based on the response from the function call to hide the progress dialog.
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 36,
                        width: 100,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Text('Verify OTP',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: "Muli",
                          ),
                        ),
                      ),
                    ),
                  if (_showProgressDialog)
                    CircularProgressIndicator(), // Show the progress dialog if needed
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
