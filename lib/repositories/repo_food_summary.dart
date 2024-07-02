import 'package:grocery_delivery_side/data/models/response/codSummaryResponseModel.dart';
import 'package:grocery_delivery_side/data/models/response/walletSummaryResponseModel.dart';
import '../data/constants/app_url.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';

class FoodSummaryRepository{
  BaseApiServices _apiServices = NetworkApiServices();

  //cod summary list
  Future<CodSummaryResponseModel> fetchFoodCodSummaryListData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiFoodResponse(
          AppUrl.codFoodSummaryListUrl, data);
      print('================ food CodSummaryResponseModel 11111111==============$response');
      print('================url data======${AppUrl.codFoodSummaryListUrl}========$data');
      print('==============2222222================${CodSummaryResponseModel
          .fromJson(response)}');
      return response = CodSummaryResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  //wallet summary list
  Future<WalletSummaryResponseModel> fetchFoodWalletSummaryListData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiFoodResponse(
          AppUrl.walletFoodSummaryListUrl, data);
      print('================food WalletSummaryResponseModel 11111111==============$response');
      print('================url data======${AppUrl.walletFoodSummaryListUrl}========$data');
      print('==============2222222================${WalletSummaryResponseModel
          .fromJson(response)}');
      return response = WalletSummaryResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}