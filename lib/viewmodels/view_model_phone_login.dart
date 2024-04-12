import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/data/models/request/PhoneLoginRequestModel.dart';
import 'package:grocery_delivery_side/helper/toast.dart';
import 'package:grocery_delivery_side/repositories/repo_phone_login.dart';
import 'package:grocery_delivery_side/screens/login%20and%20Registration/otp_screen.dart';
import '../data/models/request/sendOtpRequestModel.dart';
import '../data/models/response/phoneLoginResponseModel.dart';
import '../data/models/response/sendOtpResponseModel.dart';
import '../data/processResponse/api_process_response.dart';


class PhoneLoginViewModel with ChangeNotifier {
  final _phoneLoginRepo = PhoneLoginRepository();
  var userId = '';
  var mobile = '';
  ApiProcessResponse<PhoneLoginResponseModel> phoneLoginData = ApiProcessResponse.loading();

  setPhoneLoginData(ApiProcessResponse<PhoneLoginResponseModel> response) {
    phoneLoginData = response;
    notifyListeners();
  }

  Future<void> fetchPhoneLoginData(PhoneLoginRequestModel data, BuildContext context) async {
    setPhoneLoginData(ApiProcessResponse.loading());
    try {
      final PhoneLoginResponseModel phoneLoginResponseModel = await _phoneLoginRepo.fetchPhoneLoginData(data);
      setPhoneLoginData(ApiProcessResponse.completed(phoneLoginResponseModel));

      if (kDebugMode) {
        print("Data aa ha hai${phoneLoginResponseModel.status}");

      }

      if(phoneLoginResponseModel.record?.deliUserId!=null){
        userId = phoneLoginResponseModel.record!.deliUserId.toString();
        mobile = phoneLoginResponseModel.record!.mobileNo.toString();
        final sendOtpReqModel = SendOtpRequestModel(userId: userId);

        fetchSendOtpData(
          sendOtpReqModel,
          context,
        );

      }else{
        AppToast.showToast(phoneLoginResponseModel.message.toString());
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


      if (kDebugMode) {
        print("Kuchh to gadabad h Dya");
      }
    }
  }


  ApiProcessResponse<SendOtpResponseModel> sendOtpData = ApiProcessResponse.loading();
  setSendOtpData(ApiProcessResponse<SendOtpResponseModel> response) {
    sendOtpData = response;
    notifyListeners();
  }

  Future<void> fetchSendOtpData(SendOtpRequestModel data, BuildContext context) async {
    setSendOtpData(ApiProcessResponse.loading());
    try {
      final SendOtpResponseModel sendOtpResponseModel = await _phoneLoginRepo.fetchSendOtpData(data);

      setSendOtpData(ApiProcessResponse.completed(sendOtpResponseModel));

      if(sendOtpResponseModel.status!='error'){
        Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(userId: userId,mobile: mobile,),),);

      }else{
        AppToast.showToast(sendOtpResponseModel.message.toString());
      }

      if (kDebugMode) {
        print("Data aa ha hai${sendOtpResponseModel.status}");
      }


      AppToast.showToast(sendOtpResponseModel.message.toString());

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
      final SendOtpResponseModel sendOtpResponseModel = await _phoneLoginRepo.fetchSendOtpData(data);
      setSendOtpData(ApiProcessResponse.completed(sendOtpResponseModel));


      if (kDebugMode) {
        print("Kuchh to gadabad h Dya");
      }
    }
  }



}