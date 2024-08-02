import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_delivery_side/data/models/request/getCustomerIdReqModel.dart';
import 'package:grocery_delivery_side/data/models/response/getCustomerIdResModel.dart';
import 'package:grocery_delivery_side/repositories/repo_razorpay.dart';
import '../data/processResponse/api_process_response.dart';


class RazorPayViewModel with ChangeNotifier {
  final _razorPayRepo = RazorPayRepository();

  ApiProcessResponse<GetCustomerIdResModel> customerIdData = ApiProcessResponse.loading();

  getCustomerIdData(ApiProcessResponse<GetCustomerIdResModel> response) {
    customerIdData = response;
    notifyListeners();
  }

  Future<void> fetchCustomerIdData(GetCustomerIdReqModel data, BuildContext context) async {
    getCustomerIdData(ApiProcessResponse.loading());
    try {
      final GetCustomerIdResModel getCustomerIdResModel = await _razorPayRepo.fetchCustomerIdData(data);
      getCustomerIdData(ApiProcessResponse.completed(getCustomerIdResModel));

      if (kDebugMode) {
        print("Data aa ha hai${getCustomerIdResModel.id}");

      }


    } catch (error) {
      if (error is SocketException) {
        getCustomerIdData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        getCustomerIdData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        getCustomerIdData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        getCustomerIdData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }
      final GetCustomerIdResModel getCustomerIdResModel = await _razorPayRepo.fetchCustomerIdData(data);
      getCustomerIdData(ApiProcessResponse.completed(getCustomerIdResModel));

      if (kDebugMode) {
        print("Kuchh to gadabad h Dya $error");
      }
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
}