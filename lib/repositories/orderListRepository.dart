import 'package:grocery_delivery_side/data/models/response/registerResponseModel.dart';

import '../data/constants/app_url.dart';
import '../data/models/response/OrderListResponseModel.dart';
import '../data/models/response/phoneLoginResponseModel.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';

class OrderListRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<OrderListResponseModel> fetchOrderListData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.orderListUrl, data);
      print('================11111111==============$response');
      print('==============2222222================${OrderListResponseModel
          .fromJson(response)}');
      return response = OrderListResponseModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}