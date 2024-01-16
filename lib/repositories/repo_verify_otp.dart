import 'package:grocery_delivery_side/data/models/response/verifyOtpResponseModel.dart';

import '../data/constants/app_url.dart';
import '../data/models/response/phoneLoginResponseModel.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';

class VerifyOtpRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<VerifyOtpResponseModel> fetchVerifyOtpData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.verifyOtpUrl, data);
      print('================11111111==============$response');
      print('==============2222222================${VerifyOtpResponseModel
          .fromJson(response)}');
      return response = VerifyOtpResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}