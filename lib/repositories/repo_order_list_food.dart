
import 'package:grocery_delivery_side/data/models/response/acceptOrderResponseModel.dart';

import '../data/constants/app_url.dart';
import '../data/models/response/OrderListResponseModel.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';

class OrderListFoodRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  //orderlist
  Future<OrderListResponseModel> fetchOrderListData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiFoodResponse(
          AppUrl.orderListFoodUrl, data);
      print('================ orderlist 11111111==============$response');
      print('================url data======${AppUrl.orderListFoodUrl}========$data');
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
      dynamic response = await _apiServices.getPostApiFoodResponse(
          AppUrl.acceptFoodOrder, data);
      print('================Accept 11111111==============$response');
      print('================url data======${AppUrl.acceptFoodOrder}========$data');
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
      dynamic response = await _apiServices.getPostApiFoodResponse(
          AppUrl.cancelFoodOrder, data);
      print('================Cancel 11111111==============$response');
      print('================url data======${AppUrl.cancelFoodOrder}========$data');
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
      dynamic response = await _apiServices.getPostApiFoodResponse(
          AppUrl.rejectFoodOrder, data);
      print('================Reject 11111111==============$response');
      print('================url data======${AppUrl.rejectFoodOrder}========$data');
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
      dynamic response = await _apiServices.getPostApiFoodResponse(
          AppUrl.returnFoodOrder, data);
      print('================Return 11111111==============$response');
      print('================url data======${AppUrl.returnFoodOrder}========$data');
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
      dynamic response = await _apiServices.getPostApiFoodResponse(
          AppUrl.returnOrderFoodCheckOtp, data);
      print('================Return verify 11111111==============$response');
      print('================url data======${AppUrl.returnOrderFoodCheckOtp}========$data');
      print('==============2222222================${AcceptOrderResponseModel
          .fromJson(response)}');
      return response = AcceptOrderResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }


  //Deliver order
  Future<AcceptOrderResponseModel> fetchDeliverOrderData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiFoodResponse(
          AppUrl.deliveredOrderFoodGetOtp, data);
      print('================Return 11111111==============$response');
      print('================url data======${AppUrl.deliveredOrderFoodGetOtp}========$data');
      print('==============2222222================${AcceptOrderResponseModel
          .fromJson(response)}');
      return response = AcceptOrderResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }


  //Deliver order otp verification
  Future<AcceptOrderResponseModel> fetchDeliverOrderVerifyOtpData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiFoodResponse(
          AppUrl.checkDeliveredFoodOtp, data);
      print('================Return 11111111==============$response');
      print('================url data======${AppUrl.checkDeliveredFoodOtp}========$data');
      print('==============2222222================${AcceptOrderResponseModel
          .fromJson(response)}');
      return response = AcceptOrderResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}