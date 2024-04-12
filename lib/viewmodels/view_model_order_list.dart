import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_delivery_side/data/models/request/acceptOrderRequestModel.dart';
import 'package:grocery_delivery_side/data/models/response/acceptOrderResponseModel.dart';
import '../data/models/request/orderListRequestModel.dart';
import '../data/models/response/OrderListResponseModel.dart';
import '../data/processResponse/api_process_response.dart';
import '../repositories/orderListRepository.dart';
import '../screens/map/delivery_loc_tracking.dart';

class OrderListViewModel with ChangeNotifier {
  final _orderListRepo = OrderListRepository();

  Order? item;
  String sourceLat='';
  String sourceLong='';
  String destiLat='';
  String destiLong='';
  String orderId = '';

  ApiProcessResponse<OrderListResponseModel> orderqListData = ApiProcessResponse.loading();
  setOrderListData(ApiProcessResponse<OrderListResponseModel> response) {
    orderqListData = response;
    notifyListeners();
  }

  ApiProcessResponse<AcceptOrderResponseModel> acceptOrderResponseData = ApiProcessResponse.loading();
  setAcceptOrderData(ApiProcessResponse<AcceptOrderResponseModel> response) {
    acceptOrderResponseData = response;
    notifyListeners();
  }

  void setItem(Order newItem) {
    item = newItem;
  }

  Future<void> fetchOrderListData(OrderListRequestModel data, BuildContext context) async {
    setOrderListData(ApiProcessResponse.loading());
    try {

      final OrderListResponseModel orderListResponseModel = await _orderListRepo.fetchOrderListData(data);

      if (orderListResponseModel.status == 'error') {
        setOrderListData(
            ApiProcessResponse.error(orderListResponseModel.message));
      } else {
        setOrderListData(ApiProcessResponse.completed(orderListResponseModel));


      }

      if (kDebugMode) {
        print("Data aa ha hai${orderListResponseModel.status}");
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


      if (kDebugMode) {
        print("Kuchh to gadabad h Dya");
      }
    }
  }


  Future<void> fetchAcceptOrderData(AcceptOrderRequestModel data, BuildContext context) async {
    setAcceptOrderData(ApiProcessResponse.loading());
    try {

      final AcceptOrderResponseModel acceptOrderResponseModel = await _orderListRepo.fetchAcceptOrderData(data);

      if (acceptOrderResponseModel.status == 'error') {
        setAcceptOrderData(
            ApiProcessResponse.error(acceptOrderResponseModel.message));
      } else {
        setAcceptOrderData(ApiProcessResponse.completed(acceptOrderResponseModel));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DeliveryLocTracking(sourceLat: sourceLat,sourceLong: sourceLong,destiLat: destiLat,destiLong: destiLong,orderId: orderId,)),
        );

      }

      if (kDebugMode) {
        print("Data aa ha hai${acceptOrderResponseModel.status}");
      }


    } catch (error) {
      if (error is SocketException) {
        setAcceptOrderData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setAcceptOrderData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setAcceptOrderData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setAcceptOrderData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }


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