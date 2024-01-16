import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/data/models/request/PhoneLoginRequestModel.dart';
import 'package:grocery_delivery_side/repositories/repo_phone_login.dart';
import 'package:grocery_delivery_side/screens/login%20and%20Registration/otp_screen.dart';
import '../data/models/response/phoneLoginResponseModel.dart';
import '../data/processResponse/api_process_response.dart';


class PhoneLoginViewModel with ChangeNotifier {
  final _phoneLoginRepo = PhoneLoginRepository();

  ApiProcessResponse<PhoneLoginResponseModel> phoneLoginData = ApiProcessResponse.loading();

  setPhoneLoginData(ApiProcessResponse<PhoneLoginResponseModel> response) {
    phoneLoginData = response;
    notifyListeners();
  }

  Future<void> fetchPhoneLoginData(PhoneLoginRequestModel data, BuildContext context) async {
    setPhoneLoginData(ApiProcessResponse.loading());
    try {
      // final Map<String, dynamic> responseData = (await _homeRepo.fetchHomeData(data)) as Map<String, dynamic>;
      final PhoneLoginResponseModel phoneLoginResponseModel = await _phoneLoginRepo.fetchPhoneLoginData(data);

      // final HomePageResponseModel homePageResponseModel = HomePageResponseModel.fromJson(responseData as String);
      setPhoneLoginData(ApiProcessResponse.completed(phoneLoginResponseModel));

      if (kDebugMode) {
        print("Data aa ha hai${phoneLoginResponseModel.status}");

      }

      if(phoneLoginResponseModel.record?.deliUserId!=null){
        var userId = phoneLoginResponseModel.record?.deliUserId.toString();
        Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(userId: userId,),),);
      }


    } catch (error) {
      if (error is SocketException) {
        setPhoneLoginData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setPhoneLoginData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setPhoneLoginData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setPhoneLoginData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }
      final PhoneLoginResponseModel phoneLoginResponseModel = await _phoneLoginRepo.fetchPhoneLoginData(data);
      setPhoneLoginData(ApiProcessResponse.completed(phoneLoginResponseModel));

      // final Map<String, dynamic> responseData = (await _homeRepo.fetchHomeData(data)) as Map<String, dynamic>;
      // final HomePageResponseModel homePageResponseModel = HomePageResponseModel.fromJson(responseData as String);

      if (kDebugMode) {
        print("Kuchh to gadabad h Dya");
      }
    }
  }
}