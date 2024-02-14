import 'package:grocery_delivery_side/data/models/response/ProfileUpdateResponseModel.dart';
import 'package:grocery_delivery_side/data/models/response/registerResponseModel.dart';

import '../data/constants/app_url.dart';
import '../data/models/response/phoneLoginResponseModel.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';

class ProfileRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<ProfileUpdateResponseModel> fetchProfileUpdateData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.profileUpdateUrl, data);
      print('================11111111==============$response');
      print('==============2222222================${ProfileUpdateResponseModel
          .fromJson(response)}');
      return response = ProfileUpdateResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}