import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_delivery_side/constants.dart';

void openNotificationBottomSheet(BuildContext context) {
  // Sample list of notifications
  List<Map<String, String>> notifications = [
    {
      'title': 'Pallavi Menghare Order Assign',
      'timestamp': '19 Mar 2024 12:21:pm',
    },
    {
      'title': 'Pallavi Menghare Order Assign',
      'timestamp': '19 Mar 2024 12:21:pm',
    },
    // Add more notification items as needed
  ];

  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Set this to true

    builder: (BuildContext context) {
      return Container(
        height: 500,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          child: Scaffold(
            backgroundColor: Color(0xFFFAFBFB),
            appBar: AppBar(
              // backgroundColor:Color(0xFFF2F8FA),
              elevation: 4.0,
              centerTitle: true,
              automaticallyImplyLeading: false,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
              title: Text(
                "Notifications",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            body: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          notifications[index]['title']!,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        subtitle: Text(
                          notifications[index]['timestamp']!,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 16,
                          ),
                          onPressed: () {
                            // Action when close icon is pressed
                          },
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );
    },
  );
}
