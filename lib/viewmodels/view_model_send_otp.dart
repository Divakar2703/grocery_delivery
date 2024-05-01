import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_delivery_side/data/models/request/sendOtpRequestModel.dart';
import 'package:grocery_delivery_side/data/models/response/sendOtpResponseModel.dart';
import 'package:grocery_delivery_side/repositories/repo_send_otp.dart';
import '../data/processResponse/api_process_response.dart';

class SendOtpViewModel with ChangeNotifier {
  final _sendOtpRepo = SendOtpRepository();

  ApiProcessResponse<SendOtpResponseModel> sendOtpData = ApiProcessResponse.loading();
  setSendOtpData(ApiProcessResponse<SendOtpResponseModel> response) {
    sendOtpData = response;
    notifyListeners();
  }

  Future<void> fetchSendOtpData(SendOtpRequestModel data, BuildContext context) async {
    setSendOtpData(ApiProcessResponse.loading());
    try {
      final SendOtpResponseModel sendOtpResponseModel = await _sendOtpRepo.fetchSendOtpData(data);

      setSendOtpData(ApiProcessResponse.completed(sendOtpResponseModel));

      if (kDebugMode) {
        print("Data aa ha hai${sendOtpResponseModel.status}");
      }
      Fluttertoast.showToast(
        msg: sendOtpResponseModel.otp.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (error) {
      if (error is SocketException) {
        setSendOtpData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setSendOtpData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setSendOtpData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setSendOtpData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }
      final SendOtpResponseModel sendOtpResponseModel = await _sendOtpRepo.fetchSendOtpData(data);
      setSendOtpData(ApiProcessResponse.completed(sendOtpResponseModel));

      if (kDebugMode) {
        print("Kuchh to gadabad h Dya");
      }
    }
  }

}