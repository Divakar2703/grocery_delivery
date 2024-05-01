import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:grocery_delivery_side/data/models/request/indextPageCountRequestModel.dart';
import 'package:grocery_delivery_side/data/models/response/notificationResModel.dart';
import 'package:grocery_delivery_side/repositories/repo_notification.dart';

import '../data/processResponse/api_process_response.dart';

class NotificationListViewModel with ChangeNotifier{
  final _notificationRepo = NotificationListRepository();

  ApiProcessResponse<NotificationResModel> notificationListData = ApiProcessResponse.loading();
  setNotificationListData(ApiProcessResponse<NotificationResModel> response) {
    notificationListData = response;
    notifyListeners();
  }


  Future<void> fetchNotificationListData(IndextPageCountRequestModel data, BuildContext context) async {
    setNotificationListData(ApiProcessResponse.loading());
    try {

      final NotificationResModel orderListResponseModel = await _notificationRepo.fetchNotificationListData(data);

      if (orderListResponseModel.status == 'error') {
        setNotificationListData(
            ApiProcessResponse.error(orderListResponseModel.message));
      } else {
        setNotificationListData(ApiProcessResponse.completed(orderListResponseModel));

      }

      if (kDebugMode) {
        print("Data aa ha hai${orderListResponseModel.status}");
      }

    } catch (error) {
      if (error is SocketException) {
        setNotificationListData(ApiProcessResponse.error('No Internet Connection'));
      } else if (error is HttpException) {
        setNotificationListData(ApiProcessResponse.error('HTTP Error: ${error.message}'));
      } else if (error is FormatException) {
        setNotificationListData(ApiProcessResponse.error('Response Format Error: ${error.message}'));
      } else {
        setNotificationListData(ApiProcessResponse.error('An unexpected error occurred: $error'));
      }

      if (kDebugMode) {
        print("Kuchh to gadabad h Dya");
      }
    }
  }

}