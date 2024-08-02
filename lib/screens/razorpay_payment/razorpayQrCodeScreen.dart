import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/data/models/request/getCustomerIdReqModel.dart';
import 'package:grocery_delivery_side/screens/razorpay_payment/razorpay_barcode_popup.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_razorpay.dart';

class GetCustomerIdScreen extends StatefulWidget {
  const GetCustomerIdScreen({super.key});

  @override
  State<GetCustomerIdScreen> createState() => _GetCustomerIdState();
}

class _GetCustomerIdState extends State<GetCustomerIdScreen> {
  late RazorPayViewModel razorPayViewModel;

  @override
  void initState() {
    super.initState();
    razorPayViewModel = RazorPayViewModel(); // Initialize your view model here
  }

  void getCustomerId() {
    final data = GetCustomerIdReqModel(
      name: "Devashish yadav",
      email: "devashish.yadav@gmail.com",
      contact: "8306614863",
      failExisting: "1",
      // gstin: "12ABCDE2356F7GH",
      notes: Notes(
        notesKey1: "Some note",
        notesKey2: "Another note",
      ),
    );

    razorPayViewModel.fetchCustomerIdData(data, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Customer ID'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: getCustomerId,
                child: const Text('Fetch Customer ID'),
              ),
              SizedBox(height: 16,),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RazorPayQRCodeScreen()),
                  );
                },
                child: const Text('go to QR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
