import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_delivery_side/data/models/request/PhoneLoginRequestModel.dart';
import 'package:grocery_delivery_side/repositories/repo_phone_login.dart';
import 'package:grocery_delivery_side/screens/login%20and%20Registration/otp_screen.dart';
import '../data/models/request/registerRequestModel.dart';
import '../data/models/request/sendOtpRequestModel.dart';
import '../data/models/response/phoneLoginResponseModel.dart';
import '../data/models/response/registerResponseModel.dart';
import '../data/models/response/sendOtpResponseModel.dart';
import '../data/processResponse/api_process_response.dart';
import '../helper/toast.dart';
import '../repositories/repo_register.dart';


class RegisterViewModel with ChangeNotifier {
  final _registerRepo = RegisterRepository();
  String mobile = '';
  var userId = '';
  ApiProcessResponse<RegisterResponseModel> registerData = ApiProcessResponse.loading();

  setRegisterData(ApiProcessResponse<RegisterResponseModel> response) {
    registerData = response;
    notifyListeners();
  }

  Future<void> fetchRegisterData(RegisterRequestModel data, BuildContext context) async {
    setRegisterData(ApiProcessResponse.loading());
    try {
      final RegisterResponseModel registerResponseModel = await _registerRepo.fetchRegisterData(data);

      setRegisterData(ApiProcessResponse.completed(registerResponseModel));

      if (kDebugMode) {
        print("Data aa ha hai${registerResponseModel.status}");

      }

      if(registerResponseModel.status! =="success" && registerResponseModel.message! != "User Already Register"){

        userId = registerResponseModel.userId.toString();
        final sendOtpReqModel = SendOtpRequestModel(userId: userId);

        fetchSendOtpData(
          sendOtpReqModel,
          context,
        );

        // Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(userId: userId,mobile: mobile,),),);
      }else{
        AppToast.showToast(registerResponseModel.message.toString());
      }


    } catch (error) {
      if (error is SocketException) {
        setRegisterData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setRegisterData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setRegisterData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setRegisterData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }
      final RegisterResponseModel registerResponseModel = await _registerRepo.fetchRegisterData(data);
      setRegisterData(ApiProcessResponse.completed(registerResponseModel));


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
      final SendOtpResponseModel sendOtpResponseModel = await _registerRepo.fetchSendOtpDataReg(data);

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
      final SendOtpResponseModel sendOtpResponseModel = await _registerRepo.fetchSendOtpDataReg(data);
      setSendOtpData(ApiProcessResponse.completed(sendOtpResponseModel));


      if (kDebugMode) {
        print("Kuchh to gadabad h Dya");
      }
    }
  }

}