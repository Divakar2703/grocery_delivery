import 'package:grocery_delivery_side/data/models/request/updateLocationResModel.dart';

import '../data/constants/app_url.dart';
import '../data/models/response/indextPageCountResponseModel.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';

class IndextPageCountRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<IndextPageCountResponseModel> fetchIndextPageCountData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.indextPageCountUrl, data);
      print('================11111111==============$response');
      print('==============2222222================${IndextPageCountResponseModel
          .fromJson(response)}');
      return response = IndextPageCountResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<UpdateLocationResModel> fetchUpdateLocationData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.updatedLocationUrl, data);
      print('================11111111==============$response');
      print('==============2222222================${UpdateLocationResModel
          .fromJson(response)}');
      return response = UpdateLocationResModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}