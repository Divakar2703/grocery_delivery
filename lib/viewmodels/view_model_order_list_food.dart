import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_delivery_side/data/models/request/SubmitOrdCollReq.dart';
import 'package:grocery_delivery_side/data/models/request/acceptOrderRequestModel.dart';
import 'package:grocery_delivery_side/data/models/request/cancelOrderRequestModel.dart';
import 'package:grocery_delivery_side/data/models/request/deliverOrderVerifyOtpRequestModel.dart';
import 'package:grocery_delivery_side/data/models/request/rejectOrderRequestModel.dart';
import 'package:grocery_delivery_side/data/models/request/returnOrderVerifyOtpRequestModel.dart';
import 'package:grocery_delivery_side/data/models/response/GetPayTypeRes.dart';
import 'package:grocery_delivery_side/data/models/response/GetPayTypeRes.dart';
import 'package:grocery_delivery_side/data/models/response/SubmitOrdCollRes.dart';
import 'package:grocery_delivery_side/data/models/response/SubmitOrdCollRes.dart';
import 'package:grocery_delivery_side/data/models/response/acceptOrderResponseModel.dart';
import 'package:grocery_delivery_side/screens/Orders/Componenets/All/orders_list_screen.dart';
import 'package:grocery_delivery_side/screens/Orders/food_orders/food_order_list_tab_screen.dart';
import '../data/models/request/orderListRequestModel.dart';
import '../data/models/response/OrderListResponseModel.dart';
import '../data/processResponse/api_process_response.dart';
import '../repositories/order_list_repository.dart';
import '../repositories/repo_order_list_food.dart';
import '../screens/map/delivery_loc_tracking.dart';

class OrderListFoodViewModel with ChangeNotifier {
  final _orderListRepo = OrderListFoodRepository();

  Order? item;
  double sourceLat=0.0;
  double sourceLong=0.0;
  double destiLat=0.0;
  double destiLong=0.0;
  String orderId = '';

  ApiProcessResponse<OrderListResponseModel> orderqListData = ApiProcessResponse.loading();
  setOrderListData(ApiProcessResponse<OrderListResponseModel> response) {
    orderqListData = response;
    notifyListeners();
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
        print("Catch Error=======$error");
      }
    }
  }

  ApiProcessResponse<AcceptOrderResponseModel> acceptOrderResponseData = ApiProcessResponse.loading();
  setAcceptOrderData(ApiProcessResponse<AcceptOrderResponseModel> response) {
    acceptOrderResponseData = response;
    notifyListeners();
  }
  Future<void> fetchAcceptOrderData(AcceptOrderRequestModel data, BuildContext context) async {
    setAcceptOrderData(ApiProcessResponse.loading());
    try {

      final AcceptOrderResponseModel acceptOrderResponseModel = await _orderListRepo.fetchAcceptOrderData(data);

      if (acceptOrderResponseModel.status == 'error') {
        setAcceptOrderData(
            ApiProcessResponse.error(acceptOrderResponseModel.message));
        showToast(acceptOrderResponseModel.message?? "Something went wrong!.");

      } else {
        setAcceptOrderData(ApiProcessResponse.completed(acceptOrderResponseModel));
        showToast(acceptOrderResponseModel.message?? "Order Accepted");
        goBack(context);

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
        print("Catch Error=======$error");

      }
    }
  }




  //cancel order
  ApiProcessResponse<AcceptOrderResponseModel> cancelOrderResponseData = ApiProcessResponse.loading();
  setCancelOrderData(ApiProcessResponse<AcceptOrderResponseModel> response) {
    cancelOrderResponseData = response;
    notifyListeners();
  }
  Future<void> fetchCancelOrderData(CancelOrderRequestModel data, BuildContext context) async {
    setCancelOrderData(ApiProcessResponse.loading());
    try {

      final AcceptOrderResponseModel acceptOrderResponseModel = await _orderListRepo.fetchCancelOrderData(data);

      if (acceptOrderResponseModel.status == 'error') {
        setCancelOrderData(
            ApiProcessResponse.error(acceptOrderResponseModel.message));
        showToast(acceptOrderResponseModel.message?? "Something went wrong!.");

      } else {
        setCancelOrderData(ApiProcessResponse.completed(acceptOrderResponseModel));
        showToast(acceptOrderResponseModel.message?? "Order Cancelled");
        goBack(context);

      }

      if (kDebugMode) {
        print("Data aa ha hai${acceptOrderResponseModel.status}");
      }


    } catch (error) {
      if (error is SocketException) {
        setCancelOrderData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setCancelOrderData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setCancelOrderData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setCancelOrderData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }


      if (kDebugMode) {
        print("Catch Error=======$error");
      }
    }
  }



  //Reject order
  ApiProcessResponse<AcceptOrderResponseModel> rejectOrderResponseData = ApiProcessResponse.loading();
  setRejectOrderData(ApiProcessResponse<AcceptOrderResponseModel> response) {
    rejectOrderResponseData = response;
    notifyListeners();
  }
  Future<void> fetchRejectOrderData(RejectOrderRequestModel data, BuildContext context) async {
    setRejectOrderData(ApiProcessResponse.loading());
    try {

      final AcceptOrderResponseModel acceptOrderResponseModel = await _orderListRepo.fetchRejectOrderData(data);

      if (acceptOrderResponseModel.status == 'error') {
        setRejectOrderData(
            ApiProcessResponse.error(acceptOrderResponseModel.message));
        showToast(acceptOrderResponseModel.message?? "Something went wrong!.");

      } else {
        setRejectOrderData(ApiProcessResponse.completed(acceptOrderResponseModel));

        showToast(acceptOrderResponseModel.message?? "Order Rejected");
        goBack(context);

      }

      if (kDebugMode) {
        print("Data aa ha hai${acceptOrderResponseModel.status}");
      }


    } catch (error) {
      if (error is SocketException) {
        setRejectOrderData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setRejectOrderData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setRejectOrderData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setRejectOrderData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }


      if (kDebugMode) {
        print("Catch Error=======$error");
      }
    }
  }


  //Return order
  ApiProcessResponse<AcceptOrderResponseModel> returnOrderResponseData = ApiProcessResponse.loading();
  setReturnOrderData(ApiProcessResponse<AcceptOrderResponseModel> response) {
    returnOrderResponseData = response;
    notifyListeners();
  }
  Future<void> fetchReturnOrderData(AcceptOrderRequestModel data, BuildContext context) async {
    setReturnOrderData(ApiProcessResponse.loading());
    try {

      final AcceptOrderResponseModel acceptOrderResponseModel = await _orderListRepo.fetchReturnOrderData(data);

      if (acceptOrderResponseModel.status == 'error') {
        setReturnOrderData(
            ApiProcessResponse.error(acceptOrderResponseModel.message));
        showToast(acceptOrderResponseModel.message?? "Something went wrong!.");

      } else {
        setReturnOrderData(ApiProcessResponse.completed(acceptOrderResponseModel));
        showToast(acceptOrderResponseModel.message?? "OTP sent!..");

      }

      if (kDebugMode) {
        print("Data aa ha hai${acceptOrderResponseModel.status}");
      }


    } catch (error) {
      if (error is SocketException) {
        setReturnOrderData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setReturnOrderData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setReturnOrderData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setReturnOrderData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }


      if (kDebugMode) {
        print("Catch Error=======$error");
      }
    }
  }


  //Return order verify Otp
  ApiProcessResponse<AcceptOrderResponseModel> returnOrderVerifyOtpResponseData = ApiProcessResponse.loading();
  setReturnOrderVerifyOtpData(ApiProcessResponse<AcceptOrderResponseModel> response) {
    returnOrderVerifyOtpResponseData = response;
    notifyListeners();
  }
  Future<void> fetchReturnOrderVerifyOtpData(ReturnOrderVerifyOtpRquestModel data, BuildContext context) async {
    setReturnOrderVerifyOtpData(ApiProcessResponse.loading());
    try {

      final AcceptOrderResponseModel acceptOrderResponseModel = await _orderListRepo.fetchReturnOrderVerifyOtpData(data);

      if (acceptOrderResponseModel.status == 'error') {
        setReturnOrderVerifyOtpData(
            ApiProcessResponse.error(acceptOrderResponseModel.message));
        showToast(acceptOrderResponseModel.message?? "Something went wrong!.");

      } else {
        setReturnOrderVerifyOtpData(ApiProcessResponse.completed(acceptOrderResponseModel));
        showToast(acceptOrderResponseModel.message?? "Order Returned");
        goBack(context);

      }

      if (kDebugMode) {
        print("Data aa ha hai${acceptOrderResponseModel.status}");
      }


    } catch (error) {
      if (error is SocketException) {
        setReturnOrderVerifyOtpData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setReturnOrderVerifyOtpData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setReturnOrderVerifyOtpData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setReturnOrderVerifyOtpData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }


      if (kDebugMode) {
        print("Catch Error=======$error");
      }
    }
  }


  //Deliver order
  ApiProcessResponse<AcceptOrderResponseModel> deliverOrderResponseData = ApiProcessResponse.loading();
  setDeliverOrderData(ApiProcessResponse<AcceptOrderResponseModel> response) {
    deliverOrderResponseData = response;
    notifyListeners();
  }
  Future<void> fetchdeliverOrderData(AcceptOrderRequestModel data, BuildContext context) async {
    setDeliverOrderData(ApiProcessResponse.loading());
    try {

      final AcceptOrderResponseModel acceptOrderResponseModel = await _orderListRepo.fetchDeliverOrderData(data);

      if (acceptOrderResponseModel.status == 'error') {
        setDeliverOrderData(
            ApiProcessResponse.error(acceptOrderResponseModel.message));
        showToast(acceptOrderResponseModel.message?? "Something went wrong!.");

      } else {
        setDeliverOrderData(ApiProcessResponse.completed(acceptOrderResponseModel));
        showToast(acceptOrderResponseModel.message?? "Otp sent");


      }

      if (kDebugMode) {
        print("Data aa ha hai${acceptOrderResponseModel.status}");
      }


    } catch (error) {
      if (error is SocketException) {
        setDeliverOrderData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setDeliverOrderData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setDeliverOrderData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setDeliverOrderData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }


      if (kDebugMode) {
        print("Catch Error=======$error");
      }
    }
  }


//Deliver order verify Otp
  ApiProcessResponse<AcceptOrderResponseModel> deliverOrderVerifyOtpResponseData = ApiProcessResponse.loading();
  setDeliverOrderVerifyOtpData(ApiProcessResponse<AcceptOrderResponseModel> response) {
    deliverOrderVerifyOtpResponseData = response;
    notifyListeners();
  }
  Future<void> fetchDeliverOrderVerifyOtpData(DeliverOrderVerifyOtpRequestModel data, BuildContext context) async {
    setDeliverOrderVerifyOtpData(ApiProcessResponse.loading());
    try {

      final AcceptOrderResponseModel acceptOrderResponseModel = await _orderListRepo.fetchDeliverOrderVerifyOtpData(data);

      if (acceptOrderResponseModel.status == 'error') {
        setDeliverOrderVerifyOtpData(
            ApiProcessResponse.error(acceptOrderResponseModel.message));
        showToast(acceptOrderResponseModel.message?? "OTP not verified please try again!.");

      } else {
        setDeliverOrderVerifyOtpData(ApiProcessResponse.completed(acceptOrderResponseModel));
        showToast(acceptOrderResponseModel.message?? "Order Delivered");
       goBack(context);
      }

      if (kDebugMode) {
        print("Data aa ha hai${acceptOrderResponseModel.status}");
      }


    } catch (error) {
      if (error is SocketException) {
        setDeliverOrderVerifyOtpData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setDeliverOrderVerifyOtpData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setDeliverOrderVerifyOtpData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setDeliverOrderVerifyOtpData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }


      if (kDebugMode) {
        print("Catch Error=======$error");
      }
    }
  }


  ApiProcessResponse<GetPayTypeRes> getPayTypeResData = ApiProcessResponse.loading();
  setPayTypeResData(ApiProcessResponse<GetPayTypeRes> response) {
    getPayTypeResData = response;
    notifyListeners();
  }

  Future<void> getPayType(BuildContext context) async {
    setPayTypeResData(ApiProcessResponse.loading());
    try {

      final GetPayTypeRes getPayTypeRes = await _orderListRepo.getPayTypeData();
      print("payTypeRes:> $getPayTypeRes");
      setPayTypeResData(ApiProcessResponse.completed(getPayTypeRes));


    } catch (error) {
      if (error is SocketException) {
        setDeliverOrderVerifyOtpData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setDeliverOrderVerifyOtpData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setDeliverOrderVerifyOtpData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setDeliverOrderVerifyOtpData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }


      if (kDebugMode) {
        print("Catch Error=======$error");
      }
    }
  }

  ApiProcessResponse<SubmitOrdCollRes> getOrdCollResData = ApiProcessResponse.loading();
  setOrdCollResData(ApiProcessResponse<SubmitOrdCollRes> response) {
    getOrdCollResData = response;
    notifyListeners();
  }


  Future<void> submitOrdCollType(SubmitOrdCollReq data, BuildContext context) async {
    setOrdCollResData(ApiProcessResponse.loading());
    try {

      final SubmitOrdCollRes submitOrdCollRes = await _orderListRepo.submitOrdCollection(data);
      print("ordCollectionRes:> $submitOrdCollRes");

      if(submitOrdCollRes.status==200){
        setOrdCollResData(ApiProcessResponse.completed(submitOrdCollRes));
      }else{
        setOrdCollResData(ApiProcessResponse.error(submitOrdCollRes.message));
      }


    } catch (error) {
      if (error is SocketException) {
        setDeliverOrderVerifyOtpData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setDeliverOrderVerifyOtpData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setDeliverOrderVerifyOtpData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setDeliverOrderVerifyOtpData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }


      if (kDebugMode) {
        print("Catch Error=======$error");
      }
    }
  }
  
  Future<void> goBack(BuildContext context) async {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => OrderScreenNewFood(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
          (Route<dynamic> route) => false,
    );
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