import 'package:grocery_delivery_side/data/models/response/codSummaryResponseModel.dart';
import 'package:grocery_delivery_side/data/models/response/walletSummaryResponseModel.dart';

import '../data/constants/app_url.dart';
import '../data/models/response/OrderListResponseModel.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';

class SummaryRepository{
  BaseApiServices _apiServices = NetworkApiServices();

  //cod summary list
  Future<CodSummaryResponseModel> fetchCodSummaryListData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.codSummaryListUrl, data);
      print('================ CodSummaryResponseModel 11111111==============$response');
      print('================url data======${AppUrl.orderListUrl}========$data');
      print('==============2222222================${CodSummaryResponseModel
          .fromJson(response)}');
      return response = CodSummaryResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  //wallet summary list
  Future<WalletSummaryResponseModel> fetchWalletSummaryListData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.walletSummaryListUrl, data);
      print('================ WalletSummaryResponseModel 11111111==============$response');
      print('================url data======${AppUrl.walletSummaryListUrl}========$data');
      print('==============2222222================${WalletSummaryResponseModel
          .fromJson(response)}');
      return response = WalletSummaryResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}