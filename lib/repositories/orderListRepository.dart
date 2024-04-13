
import 'package:grocery_delivery_side/data/models/response/acceptOrderResponseModel.dart';

import '../data/constants/app_url.dart';
import '../data/models/response/OrderListResponseModel.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';

class OrderListRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  //orderlist
  Future<OrderListResponseModel> fetchOrderListData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.orderListUrl, data);
      print('================ orderlist 11111111==============$response');
      print('================url data======${AppUrl.orderListUrl}========$data');
      print('==============2222222================${OrderListResponseModel
          .fromJson(response)}');
      return response = OrderListResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }


  //Accept order
  Future<AcceptOrderResponseModel> fetchAcceptOrderData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.acceptOrder, data);
      print('================Accept 11111111==============$response');
      print('================url data======${AppUrl.acceptOrder}========$data');
      print('==============2222222================${AcceptOrderResponseModel
          .fromJson(response)}');
      return response = AcceptOrderResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  //Cancel order
  Future<AcceptOrderResponseModel> fetchCancelOrderData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.cancelOrder, data);
      print('================Cancel 11111111==============$response');
      print('================url data======${AppUrl.acceptOrder}========$data');
      print('==============2222222================${AcceptOrderResponseModel
          .fromJson(response)}');
      return response = AcceptOrderResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  //Reject order
  Future<AcceptOrderResponseModel> fetchRejectOrderData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.registerUrl, data);
      print('================Reject 11111111==============$response');
      print('================url data======${AppUrl.acceptOrder}========$data');
      print('==============2222222================${AcceptOrderResponseModel
          .fromJson(response)}');
      return response = AcceptOrderResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  //Return order
  Future<AcceptOrderResponseModel> fetchReturnOrderData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.returnOrder, data);
      print('================Return 11111111==============$response');
      print('================url data======${AppUrl.acceptOrder}========$data');
      print('==============2222222================${AcceptOrderResponseModel
          .fromJson(response)}');
      return response = AcceptOrderResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  //Return order verify otp
  Future<AcceptOrderResponseModel> fetchReturnOrderVerifyOtpData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.returnOrderCheckOtp, data);
      print('================Return verify 11111111==============$response');
      print('================url data======${AppUrl.acceptOrder}========$data');
      print('==============2222222================${AcceptOrderResponseModel
          .fromJson(response)}');
      return response = AcceptOrderResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}