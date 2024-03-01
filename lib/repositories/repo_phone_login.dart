import '../data/constants/app_url.dart';
import '../data/models/response/phoneLoginResponseModel.dart';
import '../data/models/response/sendOtpResponseModel.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';

class PhoneLoginRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<PhoneLoginResponseModel> fetchPhoneLoginData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.phoneNumberUrl, data);
      print('================11111111==============$response');
      print('==============2222222================${PhoneLoginResponseModel
          .fromJson(response)}');
      return response = PhoneLoginResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }


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
}