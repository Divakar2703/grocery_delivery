import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_delivery_side/data/models/request/PhoneLoginRequestModel.dart';
import 'package:grocery_delivery_side/repositories/repo_phone_login.dart';
import 'package:grocery_delivery_side/screens/login%20and%20Registration/otp_screen.dart';
import '../data/models/request/orderListRequestModel.dart';
import '../data/models/request/registerRequestModel.dart';
import '../data/models/response/OrderListResponseModel.dart';
import '../data/models/response/phoneLoginResponseModel.dart';
import '../data/models/response/registerResponseModel.dart';
import '../data/processResponse/api_process_response.dart';
import '../repositories/orderListRepository.dart';
import '../repositories/repo_register.dart';


class OrderListViewModel with ChangeNotifier {
  final _orderListRepo = OrderListRepository();


  ApiProcessResponse<OrderListResponseModel> orderqListData = ApiProcessResponse.loading();

  setOrderListData(ApiProcessResponse<OrderListResponseModel> response) {
    orderqListData = response;
    notifyListeners();
  }

  Future<void> fetchOrderListData(OrderListRequestModel data, BuildContext context) async {
    setOrderListData(ApiProcessResponse.loading());
    try {
      // final Map<String, dynamic> responseData = (await _homeRepo.fetchHomeData(data)) as Map<String, dynamic>;
      final OrderListResponseModel orderListResponseModel = await _orderListRepo.fetchOrderListData(data);

      // final HomePageResponseModel homePageResponseModel = HomePageResponseModel.fromJson(responseData as String);
      setOrderListData(ApiProcessResponse.completed(orderListResponseModel));

      if (kDebugMode) {
        print("Data aa ha hai${orderListResponseModel.status}");

      }

      if(orderListResponseModel.status! =="success" && orderListResponseModel.message! != "User Already Register"){

        // var userId = orderListResponseModel.toString();
        // Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(userId: userId,mobile: ,),),);
      }else{
        showToast(orderListResponseModel.message.toString());
      }


    } catch (error) {
      if (error is SocketException) {
        setOrderListData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setOrderListData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setOrderListData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setOrderListData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }
      final OrderListResponseModel orderListResponseModel = await _orderListRepo.fetchOrderListData(data);
      setOrderListData(ApiProcessResponse.completed(orderListResponseModel));

      // final Map<String, dynamic> responseData = (await _homeRepo.fetchHomeData(data)) as Map<String, dynamic>;
      // final HomePageResponseModel homePageResponseModel = HomePageResponseModel.fromJson(responseData as String);

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