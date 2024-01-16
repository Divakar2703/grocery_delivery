import 'package:flutter/material.dart';

import 'cancelled_view.dart';

class CancelledCard extends StatefulWidget {
  const CancelledCard({super.key});

  @override
  State<CancelledCard> createState() => _CancelledCardState();
}

class _CancelledCardState extends State<CancelledCard> {

  final List<Map<String, dynamic>> eventItems = [
    {
      'sr': '1',
      'orderId':'#38438',
      'userName': 'Deva 123',
      'Date': '01/01/2024',
      'phoneNo':'+91-5498534358',
      'orderPrice':'Rs.1999/-',
      'paymentMode':'Online',
      'status' : 'Cancelled'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: eventItems.map((item) {
        return Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: Colors.grey
              )
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Sr No. :",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Order Id : ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "User Name :",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                    maxLines: 1, // Set maximum number of lines
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Date :",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Phone No. :",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Order Price :",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Payment mode :",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Status :",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 5
                  ),
                  Text(
                    item['sr'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                    maxLines: 1, // Set maximum number of lines
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    item['orderId'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                    maxLines: 1, // Set maximum number of lines
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    item['userName'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                    maxLines: 1, // Set maximum number of lines
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    item['Date'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                    maxLines: 1, // Set maximum number of lines
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                      height: 5
                  ),
                  Text(
                    item['phoneNo'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                    maxLines: 1, // Set maximum number of lines
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    item['orderPrice'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                    maxLines: 1, // Set maximum number of lines
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    item['paymentMode'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Muli",
                    ),
                    maxLines: 1, // Set maximum number of lines
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.red
                    ),
                    child: Text(
                      item['status'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Muli",
                      ),
                      maxLines: 1, // Set maximum number of lines
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
