// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:grocery_delivery_side/data/models/request/PhoneLoginRequestModel.dart';
// import 'package:grocery_delivery_side/data/models/request/registerRequestModel.dart';
// import 'package:grocery_delivery_side/data/models/response/registerResponseModel.dart';
// import 'package:grocery_delivery_side/repositories/repo_phone_login.dart';
// import 'package:grocery_delivery_side/screens/login%20and%20Registration/otp_screen.dart';
// import '../data/models/response/phoneLoginResponseModel.dart';
// import '../data/processResponse/api_process_response.dart';
// import '../repositories/repo_register.dart';
//
//
//
// class RegisterViewModel with ChangeNotifier {
//   final _registerRepo = RegisterRepository();
//
//   ApiProcessResponse<RegisterResponseModel> registerData = ApiProcessResponse.loading();
//
//   setRegisterData(ApiProcessResponse<RegisterResponseModel> response) {
//     registerData = response;
//     notifyListeners();
//   }
//
//   Future<void> fetchRegisterData(RegisterRequestModel data, BuildContext context) async {
//     setRegisterData(ApiProcessResponse.loading());
//     try {
//       // final Map<String, dynamic> responseData = (await _homeRepo.fetchHomeData(data)) as Map<String, dynamic>;
//       final RegisterResponseModel registerResponseModel = await _registerRepo.fetchRegisterData(data);
//
//       // final HomePageResponseModel homePageResponseModel = HomePageResponseModel.fromJson(responseData as String);
//       setRegisterData(ApiProcessResponse.completed(registerResponseModel));
//
//       if (kDebugMode) {
//         print("Data aa ha hai${registerResponseModel.status}");
//
//       }
//
//       if(registerResponseModel.record?.deliUserId!=null){
//         var userId = registerResponseModel.record?.deliUserId.toString();
//         Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(userId: userId,),),);
//       }
//
//
//     } catch (error) {
//       if (error is SocketException) {
//         setRegisterData(ApiProcessResponse.error('No Internet Connection'));
//       } else if (error is HttpException) {
//         setRegisterData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
//       } else if (error is FormatException) {
//         setRegisterData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
//       } else {
//         setRegisterData(ApiProcessResponse.error('An unexpected error occurred: $error'));
//       }
//       final RegisterResponseModel registerResponseModel = await _registerRepo.fetchRegisterData(data);
//       setRegisterData(ApiProcessResponse.completed(registerResponseModel));
//
//       // final Map<String, dynamic> responseData = (await _homeRepo.fetchHomeData(data)) as Map<String, dynamic>;
//       // final HomePageResponseModel homePageResponseModel = HomePageResponseModel.fromJson(responseData as String);
//
//       if (kDebugMode) {
//         print("Kuchh to gadabad h Dya");
//       }
//     }
//   }
// }