import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/data/models/request/clearAllNotificationRequestModel.dart';
import 'package:grocery_delivery_side/viewmodels/view_model_notification.dart';
import 'package:provider/provider.dart';
import '../../../data/constants/app_constants_value.dart';
import '../../../data/models/request/indextPageCountRequestModel.dart';
import '../../../data/processResponse/status.dart';
import '../../../helper/empty_animation.dart';
import '../../../style/colors.dart';
import '../../Orders/Componenets/All/simmer_order_list.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationListViewModel notificationListViewModel;

  @override
  void initState() {
    super.initState();
    notificationListViewModel = NotificationListViewModel();
    getAllNotifications();
  }

  void getAllNotifications()async{
    final indexCountRequestmodel = IndextPageCountRequestModel(
      userId: Constants.userIdForUse,
    );

    notificationListViewModel.fetchNotificationListData(
      indexCountRequestmodel,
      context,
    );
  }

  void clearAllNotification() async {
    final indexCountRequestmodel = ClearAllNotificationRequestModel(
      userId: Constants.userIdForUse,
      status: '1',
    );

   await notificationListViewModel.fetchClearAllNotificationData(
      indexCountRequestmodel,
      context,
    );

   getAllNotifications();
  }

  void showClearAllDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Clear All Notifications"),
          content: const Text("Are you sure you want to clear all notifications?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Clear All"),
              onPressed: () {
                clearAllNotification();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.redAccent,
              size: 22,
            ),
            onPressed: () {
              showClearAllDialog();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.grey,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ChangeNotifierProvider<NotificationListViewModel>(
        create: (BuildContext context) => notificationListViewModel,
        child: Consumer<NotificationListViewModel>(
          builder: (context, value, _) {
            switch (value.notificationListData.status ?? "") {
              case Status.LOADING:
                return Center(child: buildShimmerProductDetails());
              case Status.ERROR:
                return Center(child: emptyAnimationWidget());
              case Status.COMPLETED:
                return value.notificationListData.data!.notification!.isEmpty
                    ? Center(child: Text("No notifications available"))
                    : Container(
                  padding: const EdgeInsets.all(12),
                  child: SingleChildScrollView(
                    child: Column(
                      children: value.notificationListData.data!.notification!
                          .map((item) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 0.0),
                          child: Material(
                            shadowColor: AppColors.white,
                            elevation: 0, // Set elevation value as desired
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                  8.0, 12.0, 0.0, 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                shape: BoxShape.rectangle, // Ensure rectangular shape for the border
                              ),
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${item.createdBy} ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade800),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "Order ID: ${item.orderId}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color:
                                              Colors.grey.shade700),
                                        ),
                                        Text(
                                          "Date: ${item.createdDate}",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color:
                                              AppColors.primaryColor),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                      width: 16),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      showClearAllDialog();
                                    },
                                  ),// Add some space between the text and status
                                ],

                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
