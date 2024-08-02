import 'package:grocery_delivery_side/data/models/response/getCustomerIdResModel.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';

class RazorPayRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<GetCustomerIdResModel> fetchCustomerIdData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiRazorPayResponse(
          "https://api.razorpay.com/v1/customers", data);
      print('================fetchSendOtpData 11111111==============$response');
      print('============== fetchSendOtpData 2222222================${GetCustomerIdResModel
          .fromJson(response)}');
      return response = GetCustomerIdResModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  // Future<VerifyOtpResponseModel> fetchVerifyOtpData(dynamic data) async {
  //   try {
  //     dynamic response = await _apiServices.getPostApiResponse(
  //         AppUrl.verifyOtpUrl, data);
  //     print('================fetchVerifyOtpData 11111111==============$response');
  //     print('==============fetchVerifyOtpData 2222222================${VerifyOtpResponseModel
  //         .fromJson(response)}');
  //     return response = VerifyOtpResponseModel.fromJson(response);
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}