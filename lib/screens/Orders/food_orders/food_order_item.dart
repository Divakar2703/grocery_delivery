import 'package:flutter/material.dart';

import '../../../data/models/response/OrderListResponseModel.dart';
import '../../../data/processResponse/api_process_response.dart';
import '../../../style/colors.dart';
import 'food_order_details_screen.dart';

class FoodOrderItem extends StatefulWidget {
  final ApiProcessResponse<OrderListResponseModel> orderqListData;
  final String type;
  const FoodOrderItem({super.key, required this.orderqListData, required this.type});

  @override
  State<FoodOrderItem> createState() => _FoodOrderItemState();
}

class _FoodOrderItemState extends State<FoodOrderItem> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.orderqListData.data!.order!.map((item) {
        return
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 0.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FoodOrderDetailsScreen(item: item,type: widget.type)),
                );
              },
              child: Material(
                shadowColor: AppColors.lightGreyGreen,
                elevation: 3, // Set elevation value as desired
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(8.0, 12.0, 0.0, 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    shape:
                    BoxShape.rectangle, // Ensure rectangular shape for the border
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.white,
                        ),
                        width: 60, // Width of the image container
                        height: 60, // Responsive height
                        child: Image.network(
                          "${item.product![0].image}", // Replace with your image path
                          // Adjust the fit as needed
                        ),
                      ),
                      const SizedBox(
                          width: 16), // Add some space between the image and text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(
                              "${item.orderID}",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Ordered By: ${item.customerName}",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.purple),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Address: ${item.customerAddress}",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.yellow.shade800),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Mode: ${item.paymentMode}",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade700),
                            ),

                            if(widget.type=="Delivered" && item.paymentMode!="wallet" && item.paymentMode != "phonepe" && item.paymentMode!="online"&&item.paymentMode!="razorpay") Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Collection Mode: ${item.collectionMode}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade700),
                                ),
                                Text("Offline Collection: Rs ${item.offlineCollect}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade700),
                                ),
                                Text(
                                  "Online Collection: Rs ${item.onlineCollect}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade700),
                                ),


                              ],
                            ),

                            Text(
                              "Date: ${item.orderDate}",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: getStatusColor(item.orderStatus?.trim()),
                              ),
                              child: Text(
                                "${item.orderStatus}",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: getStatusTextColor(item.orderStatus?.trim()),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                          width: 16), // Add some space between the text and status
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\u20B9${item.orderAmount}",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue),
                          ),


                        ],
                      ),

                      const SizedBox(
                          width: 8), // Add some space between the status and the edge
                    ],
                  ),
                ),
              ),
            ),
          );

      }).toList(),
    );
  }
}

Color getStatusColor(String? status) {
  switch (status) {
    case 'Packed':
      return Colors.yellow.shade100;
    case 'Placed':
      return Colors.blue.shade100;
    case 'Shipped':
    case 'Delivered':
      return Colors.green.shade100;
    case 'cancelled':
      return Colors.red.shade100;
    default:
      return Colors.red.shade100;
  }
}

Color getStatusTextColor(String? status) {
  switch (status) {
    case 'cancelled':
      return Colors.red;
    default:
      return Colors.black;
  }
}

