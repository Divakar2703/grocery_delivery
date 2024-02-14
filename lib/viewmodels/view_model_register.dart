import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_delivery_side/data/models/request/PhoneLoginRequestModel.dart';
import 'package:grocery_delivery_side/repositories/repo_phone_login.dart';
import 'package:grocery_delivery_side/screens/login%20and%20Registration/otp_screen.dart';
import '../data/models/request/registerRequestModel.dart';
import '../data/models/response/phoneLoginResponseModel.dart';
import '../data/models/response/registerResponseModel.dart';
import '../data/processResponse/api_process_response.dart';
import '../repositories/repo_register.dart';


class RegisterViewModel with ChangeNotifier {
  final _registerRepo = RegisterRepository();
  String mobile = '';
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

        var userId = registerResponseModel.userId.toString();
        Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(userId: userId,mobile: mobile,),),);
      }else{
        showToast(registerResponseModel.message.toString());
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