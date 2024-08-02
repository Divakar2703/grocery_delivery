import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RazorPayQRCodeScreen extends StatefulWidget {
  const RazorPayQRCodeScreen({super.key});

  @override
  State<RazorPayQRCodeScreen> createState() => _RazorPayQRCodeScreenState();
}

class _RazorPayQRCodeScreenState extends State<RazorPayQRCodeScreen> {
  final _razorpay = Razorpay();
  final _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    _amountController.dispose();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Payment Successful'),
      ),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Payment Failed'),
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('External Wallet Selected'),
      ),
    );
  }

  Future<void> generateQRCode() async {
    String apiKey = 'rzp_test_KyOM9fii555ipc';
    String apiSecret = 'bunmWbUXdGyLG0q2ahsOlnJ2';
    String amount = _amountController.text;

    if (apiKey.isEmpty || apiSecret.isEmpty || amount.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter API Key, API Secret, and Amount'),
        ),
      );
      return;
    }

    final auth = 'Basic ' + base64Encode(utf8.encode('$apiKey:$apiSecret'));

    final response = await http.post(
      Uri.parse('https://api.razorpay.com/v1/payments/qr_codes'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': auth,
      },
      body: jsonEncode({
        "type": "upi_qr",
        "name": "Gote Jaga",
        "usage": "single_use",
        "fixed_amount": true,
        "payment_amount": _amountController.text,
        "description": "Do Payment of Rs. ${_amountController.text} To Gote Jaga App.",
        "customer_id": "cust_OeQkrdKymVOZJ8",
        // "close_by": 1981615838,
        "notes": {
          "purpose": "Test UPI QR code notes"
        }
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String qrCodeUrl = data['image_url'];

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Scan QR Code to Pay'),
          content: Image.network(
           qrCodeUrl
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    } else {
      throw Exception('Failed to generate QR code');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Razorpay QR Code Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Amount',
                // keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateQRCode,
              child: const Text('Generate QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
