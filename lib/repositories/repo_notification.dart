import 'package:grocery_delivery_side/data/models/response/notificationResModel.dart';

import '../data/constants/app_url.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';

class NotificationListRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  //orderlist
  Future<NotificationResModel> fetchNotificationListData(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.notificationListUrl, data);
      print('================ orderlist 11111111==============$response');
      print('================url data======${AppUrl.notificationListUrl}========$data');
      print('==============2222222================${NotificationResModel
          .fromJson(response)}');
      return response = NotificationResModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}