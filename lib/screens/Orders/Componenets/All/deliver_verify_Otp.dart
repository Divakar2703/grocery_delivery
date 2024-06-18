import 'package:flutter/material.dart';

class DeliverOtpVerification extends StatefulWidget {
  final String payId;
  final String orderId;
  final Function(String payId, String otp) deliverOrderVerifyOtpCallback;

  const DeliverOtpVerification({
    super.key,
    required this.payId,
    required this.orderId,
    required this.deliverOrderVerifyOtpCallback,
  });

  @override
  _DeliverOtpVerificationState createState() => _DeliverOtpVerificationState();
}

class _DeliverOtpVerificationState extends State<DeliverOtpVerification> {
  TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;

  void verifyOtp(String otp) async {
    setState(() {
      _isLoading = true;
    });

    await widget.deliverOrderVerifyOtpCallback(widget.payId, otp);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                const Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Enter OTP',
                    counterText: '',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String enteredOtp = _otpController.text;
                    verifyOtp(enteredOtp);
                  },
                  child: Text('Verify OTP'),
                ),
              ],
            ),
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
