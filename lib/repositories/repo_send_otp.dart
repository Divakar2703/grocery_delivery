import 'package:grocery_delivery_side/data/models/response/sendOtpResponseModel.dart';

import '../data/constants/app_url.dart';
import '../data/models/response/phoneLoginResponseModel.dart';
import '../data/models/response/verifyOtpResponseModel.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';

class SendOtpRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<SendOtpResponseModel> fetchSendOtpData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.sendOtpUrl, data);
      print('================fetchSendOtpData 11111111==============$response');
      print('============== fetchSendOtpData 2222222================${SendOtpResponseModel
          .fromJson(response)}');
      return response = SendOtpResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<VerifyOtpResponseModel> fetchVerifyOtpData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.verifyOtpUrl, data);
      print('================fetchVerifyOtpData 11111111==============$response');
      print('==============fetchVerifyOtpData 2222222================${VerifyOtpResponseModel
          .fromJson(response)}');
      return response = VerifyOtpResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}