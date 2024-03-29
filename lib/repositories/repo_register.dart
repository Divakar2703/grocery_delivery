import 'package:grocery_delivery_side/data/models/response/registerResponseModel.dart';

import '../data/constants/app_url.dart';
import '../data/models/response/phoneLoginResponseModel.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';

class RegisterRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<RegisterResponseModel> fetchRegisterData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.registerUrl, data);
      print('================11111111==============$response');
      print('==============2222222================${RegisterResponseModel
          .fromJson(response)}');
      return response = RegisterResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}