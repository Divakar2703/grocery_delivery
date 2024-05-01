import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/data/models/request/verifyOtpRequestModel.dart';
import 'package:grocery_delivery_side/data/models/response/verifyOtpResponseModel.dart';
import 'package:grocery_delivery_side/new_init_screen.dart';
import 'package:grocery_delivery_side/repositories/repo_verify_otp.dart';
import 'package:grocery_delivery_side/screens/login%20and%20Registration/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/constants/app_constants_value.dart';
import '../data/processResponse/api_process_response.dart';
import '../helper/toast.dart';

class VerifyOtpViewModel with ChangeNotifier {
  final _verifyOtpRepo = VerifyOtpRepository();
  String? userId = '';
  String? userName = '';
  String? mobile = '';
  String? fromScreen = '';

  ApiProcessResponse<VerifyOtpResponseModel> verifyOtpData = ApiProcessResponse.loading();
  setVerifyOtpData(ApiProcessResponse<VerifyOtpResponseModel> response) {
    verifyOtpData = response;
    notifyListeners();
  }
  
  void navigateToHome(BuildContext context) async{
    final SharedPreferences sp =  await SharedPreferences.getInstance();
    sp.setString(Constants.userId, userId!);
    // sp.setString(Constants.name, userName!);
    sp.setString(Constants.mobile, mobile!);
    sp.setBool(Constants.isLogin, true);
    Constants.userIdForUse = sp.getString(Constants.userId) ?? '';
    if(fromScreen=='register'){

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => LoginUser()),
            (Route<dynamic> route) => false, // This predicate will always return false, which clears the entire stack
      );

    }else{

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => NewInitScrren()),
            (Route<dynamic> route) => false, // This predicate will always return false, which clears the entire stack
      );

    }

  }
  Future<void> fetchVerifyOtpData(VerifyOtpRequestModel data, BuildContext context) async {
    setVerifyOtpData(ApiProcessResponse.loading());
    try {
      final VerifyOtpResponseModel verifyOtpResponseModel = await _verifyOtpRepo.fetchVerifyOtpData(data);
      setVerifyOtpData(ApiProcessResponse.completed(verifyOtpResponseModel));
      if(verifyOtpResponseModel.status != 'error'){

        navigateToHome(context);
      }
      else{
        AppToast.showToast(verifyOtpResponseModel.message.toString());
      }

      if (kDebugMode) {
        print("Data aa ha hai${verifyOtpResponseModel.status}");
      }
    } catch (error) {
      if (error is SocketException) {
        setVerifyOtpData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setVerifyOtpData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setVerifyOtpData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setVerifyOtpData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }
      final VerifyOtpResponseModel verifyOtpResponseModel = await _verifyOtpRepo.fetchVerifyOtpData(data);
      setVerifyOtpData(ApiProcessResponse.completed(verifyOtpResponseModel));

      if (kDebugMode) {
        print("Kuchh to gadabad h Dya");
      }
    }
  }
}