import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/data/models/request/PhoneLoginRequestModel.dart';
import 'package:grocery_delivery_side/data/models/request/verifyOtpRequestModel.dart';
import 'package:grocery_delivery_side/data/models/response/verifyOtpResponseModel.dart';
import 'package:grocery_delivery_side/init_screen.dart';
import 'package:grocery_delivery_side/repositories/repo_phone_login.dart';
import 'package:grocery_delivery_side/repositories/repo_verify_otp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/constants/app_constants_value.dart';
import '../data/models/response/phoneLoginResponseModel.dart';
import '../data/processResponse/api_process_response.dart';
import '../helper/toast.dart';

class VerifyOtpViewModel with ChangeNotifier {
  final _verifyOtpRepo = VerifyOtpRepository();
  String? userId = '';
  String? userName = '';
  String? mobile = '';

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

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return InitScreen();
        },
      ),
    );
  }
  Future<void> fetchVerifyOtpData(VerifyOtpRequestModel data, BuildContext context) async {
    setVerifyOtpData(ApiProcessResponse.loading());
    try {
      // final Map<String, dynamic> responseData = (await _homeRepo.fetchHomeData(data)) as Map<String, dynamic>;
      final VerifyOtpResponseModel verifyOtpResponseModel = await _verifyOtpRepo.fetchVerifyOtpData(data);

      // final HomePageResponseModel homePageResponseModel = HomePageResponseModel.fromJson(responseData as String);
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

      // final Map<String, dynamic> responseData = (await _homeRepo.fetchHomeData(data)) as Map<String, dynamic>;
      // final HomePageResponseModel homePageResponseModel = HomePageResponseModel.fromJson(responseData as String);

      if (kDebugMode) {
        print("Kuchh to gadabad h Dya");
      }
    }
  }
}